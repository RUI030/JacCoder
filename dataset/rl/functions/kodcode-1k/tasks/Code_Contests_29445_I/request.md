# determine_round_winner

You are organizing a tournament where players will compete in pairs in multiple rounds until a champion is determined. Each round consists of several games, and the winner of a round is the player who wins the most games in that round. If both players win an equal number of games in a round, a tiebreaker game is played to determine the round winner.

Given the results of all games in a round, determine the winner of the round or if a tiebreaker is needed.

Input

The first line contains a single integer n (1 ≤ n ≤ 100), the number of games played in the round.
The second line contains n characters, each either 'A' or 'B'. The i-th character represents the winner of the i-th game. 'A' means player A won the game, and 'B' means player B won the game.

Output

Print 'A' if player A is the winner of the round, 'B' if player B is the winner of the round, or 'T' if a tiebreaker game is needed.

Examples

Input

5
AABBA

Output

A

Input

6
ABBBAA

Output

T

Note

In the first example, player A wins 3 games, and player B wins 2 games. Hence, player A is the winner of the round. In the second example, player A and player B both win 3 games. A tiebreaker is needed, so the answer is 'T'.

Example:
- `determine_round_winner(5, 'AABBA') == 'A'`

Implement `determine_round_winner(n: int, results: str) -> str`.
