# max_fruits

A town has a peculiar way of organizing its annual carnival. During the carnival, there is a contest where participants need to pick fruits. The town has a single line of N fruit trees, each tree bearing a certain number of fruits. Due to city regulations, a participant can only pick fruits from a contiguous segment of exactly K trees consecutively.

You are given the number of trees, N, and an integer K which represents the length of the segment that a participant is allowed to pick from. Your task is to determine the maximum number of fruits that can be collected by picking from exactly K contiguous trees.

The first line of input contains two space-separated integers N and K (1 ≤ K ≤ N ≤ 100,000), indicating the number of trees and the allowed length of the contiguous segment, respectively.

The second line contains N space-separated integers, where the i-th integer represents the number of fruits on the i-th tree (1 ≤ fruits on each tree ≤ 1,000,000).

Output a single integer, the maximum number of fruits that can be collected by a participant by picking from exactly K consecutive trees.

For example, consider the following inputs and their expected outputs:

Example 1:
Input:
5 3
1 3 2 4 5

Output:
11

Example 2:
Input:
8 2
4 2 1 7 8 1 2 8

Output:
15

In the first example, the optimal segment to pick fruits from is the last three trees, giving a total of 2 + 4 + 5 = 11 fruits. In the second example, the optimal segment to pick fruits from is the fourth and fifth trees, giving a total of 7 + 8 = 15 fruits.

Example:
- `max_fruits(5, 3, [1, 3, 2, 4, 5]) == 11`

Implement `max_fruits(N: int, K: int, fruits: list[int]) -> int`.
