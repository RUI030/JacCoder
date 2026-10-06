# determine_winner

Alice and Bob are playing a game with an array of integers. The game involves taking turns to change elements in the array by adding or subtracting a value of 1 from any element. The objective of the game is to make all elements of the array equal. Alice always starts first, and they play optimally.

You are to determine who will win the game, assuming both players play optimally. Note that the game terminates when all elements in the array are equal.

Input

The first line of input contains a single integer n (1 ≤ n ≤ 10^5), the number of elements in the array.

The second line contains the n integers a_1, a_2, ..., a_n (1 ≤ a_i ≤ 10^9), representing the array.

Output

Print "Alice" if Alice wins, or "Bob" if Bob wins.

Examples

Input

3
1 2 3

Output

Alice

Input

4
4 4 4 4

Output

Bob

Note

In the first example, Alice can change the second element from 2 to 1. Now the array is [1, 1, 3]. Bob then changes the third element from 3 to 1. The array becomes [1, 1, 1]. Since Alice has no moves left, Alice wins.

In the second example, all elements are already equal, so Bob wins by default as there are no moves to make.

Example:
- `determine_winner(3, [1, 2, 3]) == 'Alice'`

Implement `determine_winner(n: int, array: list[int]) -> str`.
