# longest_balanced_subsequence

Masha loves playing with sequences of brackets. She has obtained a sequence consisting of n open brackets '(' and close brackets ')'. She considers a sequence balanced if the number of open brackets is equal to the number of close brackets, and every prefix of the sequence contains at least as many open brackets as close brackets.

Masha has also noticed that sometimes the sequence is not fully balanced, but contains one or more contiguous subsequences that are balanced. Her task is to find out the length of the longest contiguous balanced subsequence in the given sequence.

Input

The first line of the input contains an integer n (1 ≤ n ≤ 105), the length of the sequence.

The second line of the input contains a sequence of n characters, each being either '(' or ')'.

Output

Output a single integer — the length of the longest contiguous balanced subsequence. If no balanced subsequence exists, print 0.

Examples

Input

6
()()()

Output

6

Input

8
(())))(()

Output

4

Input

3
((()

Output

0

Note

In the first example, the entire sequence is balanced, thus the length is 6.

In the second example, the sequence `(())))` contains a balanced subsequence of length 4, which is `(()())`.

In the third example, there is no balanced subsequence, so the output is 0.

Example:
- `longest_balanced_subsequence(6, '()()()') == 6`

Implement `longest_balanced_subsequence(n: int, seq: str) -> int`.
