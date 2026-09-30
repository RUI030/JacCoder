# Compress a list of integers into ranges

Implement `compress_ranges(nums: list[int]) -> str`. `nums` is sorted ascending
with no duplicates. Write each maximal run of consecutive integers as `a-b` (or
just `a` when the run has one number) and join the runs with `,`. An empty list
gives `""`.

Example:
- `compress_ranges([1, 2, 3, 5, 7, 8]) == "1-3,5,7-8"`
