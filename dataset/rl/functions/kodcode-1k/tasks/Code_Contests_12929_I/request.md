# reconstruct_list

Given a list of integers, you are required to reconstruct a new list according to the following operations:

1. Remove all duplicates from the given list.
2. Sort the remaining elements in ascending order.
3. Replace each element in the sorted list with the sum of itself and all preceding elements in the list.

Implement the function according to the above steps and print the final result. You should also ensure that the original list remains unchanged.

Input

The first line contains a single integer n (1 ≤ n ≤ 105) — the number of elements in the list.

The second line contains n space-separated integers a1, a2, ..., an (1 ≤ ai ≤ 106) representing the list.

Output

Print the final list after applying the specified operations.

Examples

Input

5
3 1 2 1 4


Output

1 3 6 10


Input

6
10 5 8 3 8 3


Output

3 8 16 26


Input

4
2 2 2 2


Output

2

Example:
- `reconstruct_list(5, [3, 1, 2, 1, 4]) == [1, 3, 6, 10]`

Implement `reconstruct_list(n: int, elements: list[int]) -> list[int]`.
