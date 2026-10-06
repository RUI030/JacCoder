# can_be_balanced

Given a set of N brackets with types '(' and ')' in a string form, a bracket sequence is considered valid if it is balanced. A balanced bracket sequence is defined as follows:
- An empty string is balanced.
- If "S" is a balanced string, then "(S)" is also balanced.
- If "S1" and "S2" are balanced strings, then their concatenation "S1S2" is also balanced.

You are provided M operations, each operation allows you to swap any two different characters in the string. Determine if the brackets sequence can be transformed into a balanced sequence with at most M swap operations.

-----Constraints-----
- 1 ≤ N ≤ 1000
- 0 ≤ M ≤ 1000
- The length of the string is always even.

-----Inputs-----
Input is given from Standard Input in the following format:
N M
bracket_string

-----Outputs-----
Print "YES" if it is possible to make the bracket sequence balanced with at most M swaps, otherwise print "NO".

-----Sample Input-----
4 1
(()

-----Sample Output-----
YES

-----Explanation of the sample input:-----
One possible sequence of operations is:
- Swap the last two characters to get "()()" which is a balanced string. Hence the output should be "YES".

Example:
- `can_be_balanced(4, 1, '(())') == 'YES'`

Implement `can_be_balanced(N: int, M: int, bracket_string: str) -> str`.
