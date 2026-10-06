# has_pair_with_abs_difference_k

You are given an array of integers and a positive integer k. Your task is to determine if there are two distinct elements in the array whose absolute difference is at most k.

Input

The first line contains an integer n (1 ≤ n ≤ 50,000) — the number of elements in the array.

The second line contains n integers a_1, a_2, ... , a_n (1 ≤ a_i ≤ 10^9) — the elements of the array.

The third line contains a single integer k (1 ≤ k ≤ 10^9).

Output

If such a pair exists, print "YES". Otherwise, print "NO".

Examples

Input


5
1 3 6 9 12
3


Output


YES


Input


4
10 20 30 40
5


Output


NO


Note

In the first example, the pair (3, 6) has an absolute difference of 3, which is equal to k. Hence, the output is "YES".

In the second example, there is no pair of elements with an absolute difference of at most 5. Hence, the output is "NO".

Explanation

To solve this problem, you may use a sliding window approach or a set to efficiently check for pairs. Consider edge cases like very small arrays or arrays where all elements are the same.

Example:
- `has_pair_with_abs_difference_k(5, [1, 3, 6, 9, 12], 3) == 'YES'`

Implement `has_pair_with_abs_difference_k(n: int, arr: list[int], k: int) -> str`.
