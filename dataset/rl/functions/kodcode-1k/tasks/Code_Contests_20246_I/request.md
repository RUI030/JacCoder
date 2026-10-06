# determine_rank

You are given a list of integers which represent the number of points each player scored in a game. The objective is to determine the rank of a specific player's score. The rank is defined such that the player with the highest score gets rank 1, the player with the second highest score gets rank 2, and so on. If multiple players have the same score, they should have the same rank, and the next rank in the order should be skipped accordingly.

Input

The first line contains a positive integer n (1 ≤ n ≤ 100) — the number of players.

The second line contains n integers s1, s2, ..., sn (0 ≤ si ≤ 1000) — the scores of each player.

The third line contains one integer p (1 ≤ p ≤ n) — the position (1-based index) of the player for whom you need to determine the rank.

Output

Print the rank of the player at position p.

Examples

Input

5
100 200 100 300 200
3

Output

3

Input

4
50 100 75 100
1

Output

3

Note

In the first test example, the scores are 100, 200, 100, 300, and 200. The score at position 3 is 100. The unique and sorted list of scores is 300, 200, 100. So, the rank for score 100 is 3.

In the second test example, the scores are 50, 100, 75 and 100. The score at position 1 is 50. The unique and sorted list of scores is 100, 75, and 50. So, the rank for score 50 is 3.

Example:
- `determine_rank(5, [100, 200, 100, 300, 200], 3) == 3`

Implement `determine_rank(n: int, scores: list[int], p: int) -> int`.
