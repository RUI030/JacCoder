# find_two_subarrays_with_sum_k

You are given a sequence of integers array $$$a$$$ of length $$$n$$$. Your task is to determine if it is possible to form two non-overlapping subarrays such that each subarray has a sum equal to a given integer $$$k$$$. Any subarray should have at least one element.

The first line of the input contains two integers $$$n$$$ and $$$k$$$ ($$$1 \le n \le 200, -10^8 \le k \le 10^8$$$).

The second line contains $$$n$$$ integers a_1, a_2, ..., a_n$$$ ($$$-10^8 \le a_i \le 10^8$$$).

Print "YES" if it is possible to form two non-overlapping subarrays such that each subarray has a sum equal to $$$k$$$. Otherwise, print "NO".

Example:
- `find_two_subarrays_with_sum_k(5, 10, [1, 2, 3, 4, 5]) == 'NO'`

Implement `find_two_subarrays_with_sum_k(n: int, k: int, arr: list[int]) -> str`.
