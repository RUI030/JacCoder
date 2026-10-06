# max_sum_alice

Alice and Bob are playing a game where they take turns drawing cards from a deck. The deck contains `n` cards, each with a distinct integer value between 1 and `n`, inclusive. The game starts with Alice drawing the first card, followed by Bob, and they continue to take turns until all cards are drawn.

Alice and Bob have different strategies for winning:
- Alice aims to maximize the sum of the values of the cards she draws.
- Bob aims to minimize Alice's sum by drawing cards that reduce the sum of the remaining cards as much as possible.

Given the number of cards `n`, simulate the game and determine the maximum possible sum of the values of the cards that Alice can achieve if both players play optimally.

Input

The first and only line of input contains the integer `n` (1 ≤ n ≤ 1000) — the number of cards in the deck.

Output

Print a single integer, the maximum sum Alice can achieve if both players play optimally.

Examples

Input

4

Output

6

Input

5

Output

9

Input

6

Output

12

Note

In the first sample test, the deck contains cards with values {1, 2, 3, 4}. If both players play optimally, Alice will draw 4 and 2, and Bob will draw 3 and 1. Thus, Alice's sum is 4 + 2 = 6.

In the second sample test, the deck contains cards with values {1, 2, 3, 4, 5}. If both players play optimally, Alice will draw 5, 3, and 1, and Bob will draw 4 and 2. Thus, Alice's sum is 5 + 3 + 1 = 9.

Example:
- `max_sum_alice(1) == 1`

Implement `max_sum_alice(n: int) -> int`.
