# find_undefeated_players

In a certain tournament, each player competes with every other player exactly once. The ability of each player is represented as a numerical score. The score determines the likelihood of winning against another player — a player with a higher score always wins against a player with a lower score. In the event of a tie (when two players have the same score), the player with a smaller index (i.e., who appears first in the list) wins.

Given a list of integers representing the scores of players, output the list of players who will still be undefeated when the tournament ends. 

The list of scores is given as an input, where each integer represents a player's score. Your task is to find the players, represented by their indices (0-based), who will remain undefeated.

The first line contains an integer n (1 ≤ n ≤ 100), which is the number of players.
The second line contains n integers representing the scores of the players.

Print the indices of the undefeated players, each separated by a space, in ascending order.

Example:
Input:
5
2 3 2 1 4

Output:
1 4

Example:
- `find_undefeated_players([1]) == [0]`

Implement `find_undefeated_players(scores: list[int]) -> list[int]`.
