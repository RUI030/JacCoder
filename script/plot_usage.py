"""Plot a script/monitor.sh usage CSV: GPU util, VRAM and training-process RAM over time."""

import argparse, csv
from datetime import datetime, timedelta

import matplotlib
matplotlib.use("Agg")
import matplotlib.dates as mdates
import matplotlib.pyplot as plt

# Setting =================================================
SURFACE   = "#fcfcfb"
INK       = "#0b0b0b"
INK_2     = "#52514e"
GRID      = "#e4e3df"
SERIES    = "#2a78d6"     # categorical slot 1; one series per panel
PHASE_BG  = "#efeeea"     # neutral band, identity carried by the text label

# column -> (panel title, y label, y max or None)
PANEL_SPECS = {
    "gpu_util_pct": ("GPU utilization",            "%",  100),
    "vram_used_gb": ("VRAM used",                  "GB", None),
    "gpu_power_w":  ("GPU power draw",             "W",  None),
    "train_rss_gb": ("Training process RAM (RSS)", "GB", None),
}
DEFAULT_PANELS = "gpu_util_pct,vram_used_gb,train_rss_gb"


# Functions ===============================================
def read_usage(path: str) -> tuple[list[datetime], dict[str, list[float]]]:
    """Rows of monitor.sh CSV -> timestamps + one float list per column."""
    with open(path) as f:
        rows = list(csv.DictReader(f))
    times = [datetime.strptime(r["time"], "%Y-%m-%d %H:%M:%S") for r in rows]
    cols  = {k: [float(r[k]) for r in rows] for k in rows[0] if k != "time"}
    return times, cols


def parse_phase(spec: str, times: list[datetime]) -> tuple[str, datetime, datetime]:
    """`NAME=HH:MM:SS-HH:MM:SS` -> (name, start, end), dated from the CSV (handles midnight)."""
    name, span = spec.split("=", 1)
    t0, t1 = (datetime.strptime(s, "%H:%M:%S").time() for s in span.split("-"))
    day = times[0].date()
    start = datetime.combine(day, t0)
    if start < times[0] - timedelta(hours=1):
        start += timedelta(days=1)
    end = datetime.combine(start.date(), t1)
    if end < start:
        end += timedelta(days=1)
    return name, start, end


def crop(times, cols, start: datetime | None, end: datetime | None):
    """Keep rows with start <= time <= end."""
    keep = [i for i, t in enumerate(times) if (not start or t >= start) and (not end or t <= end)]
    return [times[i] for i in keep], {k: [v[i] for i in keep] for k, v in cols.items()}


def plot(times, cols, phases, panels: list[str], title: str, footnote: str, out: str) -> None:
    fig, axes = plt.subplots(len(panels), 1, figsize=(13, 2.8 * len(panels) + 0.9),
                             sharex=True, facecolor=SURFACE, squeeze=False)
    axes = axes[:, 0]
    fig.suptitle(title, color=INK, fontsize=13, x=0.01, ha="left")
    for ax, col in zip(axes, panels):
        name, unit, ymax = PANEL_SPECS[col]
        ax.set_facecolor(SURFACE)
        for label, start, end in phases:
            ax.axvspan(start, end, color=PHASE_BG, lw=0, zorder=0)
        ax.plot(times, cols[col], color=SERIES, lw=1.6, zorder=2)
        top = ymax or max(max(cols[col]) * 1.15, 1)
        if col == "vram_used_gb":
            total = cols["vram_total_gb"][0]
            top = total * 1.08
            ax.axhline(total, color=INK_2, lw=1, ls=(0, (4, 3)), zorder=1)
            ax.text(times[0], total, f" {total:.0f} GB total", va="bottom", ha="left",
                    color=INK_2, fontsize=8)
        ax.set_ylim(0, top)
        peak = max(cols[col])
        ax.set_title(f"{name}  ·  peak {peak:.1f} {unit}", loc="left", color=INK,
                     fontsize=10, pad=18 if ax is axes[0] and phases else 4)
        ax.set_ylabel(unit, color=INK_2, fontsize=9)
        ax.grid(axis="y", color=GRID, lw=0.8)
        ax.tick_params(colors=INK_2, labelsize=8, length=0)
        for side in ("top", "right", "left"):
            ax.spines[side].set_visible(False)
        ax.spines["bottom"].set_color(GRID)
    for label, start, end in phases:                  # labels once, on the top panel
        axes[0].text(start + (end - start) / 2, 103, label, ha="center", va="bottom",
                     color=INK_2, fontsize=8, clip_on=False)
    axes[-1].xaxis.set_major_formatter(mdates.DateFormatter("%H:%M"))
    axes[-1].set_xlabel("time (pod clock)", color=INK_2, fontsize=9)
    fig.text(0.01, 0.005, footnote, color=INK_2, fontsize=7.5)
    fig.tight_layout(rect=(0, 0.02, 1, 0.96), h_pad=1.6)
    fig.savefig(out, dpi=150, facecolor=SURFACE)
    print(f"wrote {out}")


# Run =====================================================
if __name__ == "__main__":
    cli = argparse.ArgumentParser(description=__doc__)
    cli.add_argument("--csv", required=True, help="usage CSV written by script/monitor.sh")
    cli.add_argument("--out", required=True, help="output PNG")
    cli.add_argument("--title", default="GPU / VRAM / RAM usage")
    cli.add_argument("--phase", action="append", default=[],
                     help="shaded span NAME=HH:MM:SS-HH:MM:SS (repeatable)")
    cli.add_argument("--panels", default=DEFAULT_PANELS,
                     help=f"comma list of {', '.join(PANEL_SPECS)} (default: %(default)s)")
    cli.add_argument("--start", help="crop: first HH:MM:SS to plot")
    cli.add_argument("--end",   help="crop: last HH:MM:SS to plot")
    cli.add_argument("--footnote", default="RSS = resident memory of train.py processes; "
                     "host-wide RAM is omitted (shared machine). Samples every 30 s from "
                     "script/monitor.sh.")
    args = cli.parse_args()

    times, cols = read_usage(args.csv)
    if args.start or args.end:
        _, start, end = parse_phase(f"crop={args.start or '00:00:00'}-{args.end or '23:59:59'}", times)
        times, cols = crop(times, cols, start if args.start else None, end if args.end else None)
    phases = [parse_phase(p, times) for p in args.phase]
    panels = [c.strip() for c in args.panels.split(",") if c.strip()]
    plot(times, cols, phases, panels, args.title, args.footnote, args.out)
