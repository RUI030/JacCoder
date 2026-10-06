import from typing { Any }
import from typing { List }
def find_top_candidates(votes: list[int]) -> list[int] {
    total_votes = sum(votes);
    if (total_votes == 0) {
        return `list(range(len(votes)));
    }
    percentages = [(i, (vote / total_votes)) for (i, vote) in enumerate(votes)];
    max_percentage = max(percentages, key=lambda (x: Any) { x[1]; })[1];
    return [
        i
        for (i, percentage) in percentages
        if (percentage == max_percentage)
    ];
}

