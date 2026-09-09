# Known concerns

## Interleave resampling

`mixing.strategy: interleave` controls the probability of selecting each
dataset. With `stopping: all_exhausted`, smaller datasets are restarted until
every dataset has been exhausted at least once. A small dataset with a large
weight can therefore be seen many times in one trainer epoch.

For example, `base_sft_v1.yaml` currently contains 5,120 unique source rows
but builds a 9,583-row mixed dataset with seed 3407. The 105-row
`scaffold2impl` dataset has a target weight of 0.15, so substantial resampling
is expected. This is intentional mixing behavior, but it increases the risk
of memorizing small datasets.

Before treating a recipe as a stable training menu, report and review:

- unique source rows per dataset;
- rows allocated to each dataset in the final mix;
- realized mixture proportion;
- effective repetitions (`allocated rows / unique rows`);
- token counts, once token-level statistics are available.

The mixer currently prints source row counts and requested weights, but does
not yet produce this full realized-mixture report.
