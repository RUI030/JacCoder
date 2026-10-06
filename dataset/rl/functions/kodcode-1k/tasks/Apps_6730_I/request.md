# max_sum_of_three_trees

In a distant land, there is a magical forest where the trees are numbered from 1 to N. Each tree has a value representing its magical power. The wizard wants to find out a special sum of powers that is computed using a particular set of rules.

The rules are as follows:
1. Select any three trees such that their combined sum of magical powers is maximum possible.
2. The selected trees must have different numbers (i.e., you cannot select the same tree more than once).

Write a program to help the wizard find the maximum possible sum of powers of any three different trees.

-----Input:-----
The first line contains an integer N, the number of trees.
The second line contains N integers representing the magical powers of the trees from 1 to N.

-----Output:-----
Output a single line containing the maximum possible sum of the powers of any three different trees.

-----Constraints:-----
3 <= N <= 1000
-1000 <= Power of each tree <= 1000

-----Example:-----
Input:
5
8 1 9 -5 4

Output:
21

Explanation:
The three trees with powers 8, 9, and 4 give the maximum possible sum which is 21.

Example:
- `max_sum_of_three_trees(5, [8, 1, 9, -5, 4]) == 21`

Implement `max_sum_of_three_trees(N: int, powers: list[int]) -> int`.
