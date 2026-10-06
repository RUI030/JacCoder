# rearrange_list

You are given a list of 'n' integers. Your task is to reorder these integers into an array such that the new array satisfies the following conditions:

1. All even numbers should come before all odd numbers.
2. The order among the even numbers should be non-decreasing.
3. The order among the odd numbers should be non-decreasing.

Write a function that rearranges the list according to these constraints.

Input:
- The first line contains an integer n (1 ≤ n ≤ 10^5), the number of elements in the list.
- The second line contains n integers a1, a2, ..., an (-10^9 ≤ ai ≤ 10^9), the elements of the list.

Output:
- Print the rearranged list of n integers such that all even integers appear before all odd integers, with both even and odd integers sorted in non-decreasing order.

Examples:

Input:
6
4 3 1 2 5 6

Output:
2 4 6 1 3 5

Input:
7
-2 -3 4 1 -1 2 0

Output:
-2 0 2 4 -3 -1 1

Example:
- `rearrange_list([4, 3, 1, 2, 5, 6]) == [2, 4, 6, 1, 3, 5]`

Implement `rearrange_list(nums: list[int]) -> list[int]`.
