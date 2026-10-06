# min_segment_swaps

The fictional country of Arrayland is undergoing a reorganization of its databases. The administrators need to sort an array of data records, but due to resource limitations, they can only use a specific form of sorting called "segment swaps". A segment swap consists of reversing any subarray of the original array.

Your task is to determine the minimum number of segment swaps required to transform a given array into its sorted form in non-decreasing order.

Input

The first line contains an integer n (1 ≤ n ≤ 100,000) — the number of elements in the array.

The second line contains n integers a1, a2, ..., an (1 ≤ ai ≤ 10^9) — the elements of the array.

Output

Output a single integer — the minimum number of segment swaps required to sort the array in non-decreasing order.

Examples

Input

5
4 3 2 1 5

Output

1

Input

6
1 3 5 2 4 6

Output

3

Note

In the first example, you can reverse the subarray [4, 3, 2, 1] to get the sorted array [1, 2, 3, 4, 5].

In the second example, the minimum number of segment swaps required involves reversing three segments: [3, 5, 2], [2, 4], and [3, 5].

Example:
- `min_segment_swaps([4, 3, 2, 1, 5]) == 1`

Implement `min_segment_swaps(arr: list[int]) -> int`.
