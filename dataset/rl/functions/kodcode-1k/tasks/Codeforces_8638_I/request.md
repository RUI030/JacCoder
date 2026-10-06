# count_even_sum_pairs

You are given an array of integers $$$a$$$ of length $$$n$$$. Your task is to find and print the number of pairs of indices $$$(i, j)$$$ such that $$$1 \leq i < j \leq n$$$ and $$$a[i] + a[j]$$$ is even.

The first line of the input contains an integer $$$n$$$ ($$$2 \leq n \leq 100$$$) — the length of the array.

The second line contains $$$n$$$ integers $$$a_1, a_2, \ldots, a_n$$$ ($$$1 \leq a_i \leq 100$$$) — the elements of the array.

Print a single integer — the number of pairs $$$(i, j)$$$ such that $$$a[i] + a[j]$$$ is even.

For example, given $$$n = 4$$$ and the array $$$a = [1, 2, 3, 4]$$$, the output should be $$$2$$$, as there are two pairs $(1, 3)$ and $(2, 4)$ that satisfy the condition.

Example:
- `count_even_sum_pairs(4, [1, 2, 3, 4]) == 2`

Implement `count_even_sum_pairs(n: int, a: list[int]) -> int`.
