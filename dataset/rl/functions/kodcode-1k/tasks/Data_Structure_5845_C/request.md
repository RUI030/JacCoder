# compressed_longest_increasing_subsequence

Find the length of the longest increasing subsequence (LIS) using an optimized approach
involving Compressed Segment Tree to handle cases where elements might be extremely large.
If any two elements in the sequence are equal, consider only their first occurrence.

>>> compressed_longest_increasing_subsequence([10, 9, 2, 5, 3, 7, 101, 18])
4
>>> compressed_longest_increasing_subsequence([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15])
6

Implement `compressed_longest_increasing_subsequence(sequence: list[int]) -> int`.
