# count_unique_triplets

You are given a list of n integers a1, a2, ..., an. Find the number of unique triplets (i, j, k) such that i < j < k and ai + aj = ak. 

The first line contains the single positive integer n (3 ≤ n ≤ 1000) — the number of integers.

The second line contains n positive integers a1, a2, ..., an (1 ≤ ai ≤ 10^5).

Print the number of unique triplets (i, j, k) that satisfy the condition ai + aj = ak.

For example, in the first example, the list [1, 2, 3, 4] includes the following triplets: (1, 2, 3) and (1, 3, 4).

In the second example, given the list [1, 1, 2, 3], the following triplets include in the answer: (1, 1, 2), and (1, 2, 3).

Example:
- `count_unique_triplets(4, [1, 2, 3, 4]) == 2`

Implement `count_unique_triplets(n: int, numbers: list[int]) -> int`.
