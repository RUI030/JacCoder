# max_sum_after_k_operations

You are given a sequence of integers $A_{1}, A_{2}, \ldots, A_{N}$ and a positive integer $K$. Your task is to find the maximum possible sum of the sequence after performing exactly $K$ operations. In each operation, you:

1. Choose any subsequence $B$ of $A$.
2. Replace each element $B_i$ in the subsequence $B$ with $|B_i|$ (the absolute value of $B_i$).

Find the maximum possible sum of the sequence after performing $K$ operations.

------ Input ------
The first line of the input contains a single integer $T$ denoting the number of test cases. The description of $T$ test cases follows.
The first line of each test case contains two space-separated integers $N$ and $K$.
The second line contains $N$ space-separated integers $A_{1}, A_{2}, \ldots, A_{N}$.

------ Output ------
For each test case, print a single line containing the maximum possible sum of the sequence after performing exactly $K$ operations.

------ Constraints ------
$1 ≤ T ≤ 10$
$1 ≤ N ≤ 10^{5}$
$1 ≤ K ≤ 10$ 
$-10^9 ≤ A_{i} ≤ 10^9$ for each valid $i$

------ Sample Input 1 ------
1
5 2
-1 2 -3 4 -5

------ Sample Output 1 ------
15

------ Explanation 1 ------
Example case 1: The original sequence is $(-1, 2, -3, 4, -5)$. 
- In the first operation, choose the subsequence $(-1, -3, -5)$ and replace each element with its absolute value to get $(1, 2, 3, 4, 5)$. 
- In the second operation, the sum remains unchanged as we already have positive values. 

The maximum sum of the sequence after 2 operations is $1 + 2 + 3 + 4 + 5 = 15$.

Example:
- `max_sum_after_k_operations(1, [((5, 2), [-1, 2, -3, 4, -5])]) == [15]`

Implement `max_sum_after_k_operations(T: int, test_cases: list[tuple[tuple[int, int], list[int]]]) -> list[int]`.
