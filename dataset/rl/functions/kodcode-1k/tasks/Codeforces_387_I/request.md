# min_cuts_to_non_decreasing

Given an array of integers representing the heights of trees in a row, you need to determine whether you can cut down some trees (not necessarily all) such that the remaining trees are in non-decreasing order of height from left to right. You can choose to cut down any number of trees and you should return the minimum number of cuts required.

Input:
- The first line contains an integer n (1 ≤ n ≤ 1000), the number of trees.
- The second line contains n integers h1, h2, ..., hn (1 ≤ hi ≤ 10000), the heights of the trees.

Output:
- Return a single integer, the minimum number of cuts required to make the heights of the remaining trees non-decreasing.

Example:
Input:
6
3 7 6 2 8 10
Output:
2

Explanation: One possible solution is to cut down the trees with heights 7 and 6, resulting in the sequence 3 2 8 10, which is non-decreasing. There might be other solutions that also require 2 cuts, but fewer cuts are not possible for this input.

Example:
- `min_cuts_to_non_decreasing([3, 7, 6, 2, 8, 10]) == 2`

Implement `min_cuts_to_non_decreasing(trees: list[int]) -> int`.
