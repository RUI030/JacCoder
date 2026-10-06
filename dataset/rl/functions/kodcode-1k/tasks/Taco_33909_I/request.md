# max_bond_strength

Hexabond manufacturing company has a peculiar way of designing its hexagonal tiles. Each hexagonal tile has a unique bond strength characterized by an integer value. The bond strength of a larger structure made of multiple hexagons is defined as the maximum sum of strength values of any contiguous subsequence of the hexagons arranged in a line. 

You are part of the team responsible for calculating this maximum bond strength efficiently for given sequences of hexagonal tiles.

Given a sequence of bond strengths, find the maximum bond strength of any contiguous subsequence of hexagonal tiles.

-----Input-----
The first line of the input contains a single integer $n$ $(1 \leq n \leq 100,000)$, which represents the number of hexagonal tiles. The second line contains $n$ space-separated integers $a_1, a_2, \ldots, a_n$ $(-10^6 \leq a_i \leq 10^6)$, where $a_i$ represents the bond strength of the $i^{th}$ hexagonal tile.

-----Output-----
Output one integer – the maximum bond strength of any contiguous subsequence of the given sequence of hexagonal tiles.

-----Examples-----
Sample Input:
5
1 -3 2 1 -1
Sample Output:
3

Sample Input:
6
-2 -3 4 -1 -2 1 5 -3
Sample Output:
7

Example:
- `max_bond_strength([1, 2, 3, 4, 5]) == 15`

Implement `max_bond_strength(bonds: list[int]) -> int`.
