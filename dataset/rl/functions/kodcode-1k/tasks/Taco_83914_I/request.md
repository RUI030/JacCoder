# minimum_dissatisfaction_score

Carol loves playing with sequences of numbers. Recently, she got fascinated with the idea of rearranging sequences to minimize the differences between consecutive elements. She defines the "dissatisfaction score" of a sequence as the sum of absolute differences between all consecutive elements of the sequence.

Given an integer array `a` of length `n`, help Carol find the minimum possible dissatisfaction score that can be achieved by rearranging the elements of the array.

-----Input-----

The first line of the input contains an integer n (1 ≤ n ≤ 100,000) — the length of the array `a`.

The second line contains n integers a_1, a_2, ..., a_n (1 ≤ a_i ≤ 1,000,000) — the elements of the array.

-----Output-----

Output a single integer representing the minimum dissatisfaction score after rearranging the elements of the array.

-----Examples-----
Input
4
2 4 1 3

Output
3

Input
3
10 1 8

Output
9

Input
5
7 7 7 7 7

Output
0

-----Note-----

In the first sample, one of the possible optimal rearrangements is [1, 2, 3, 4] which gives a dissatisfaction score of |1-2| + |2-3| + |3-4| = 1 + 1 + 1 = 3.

In the second sample, one of the possible optimal rearrangements is [1, 8, 10] which gives a dissatisfaction score of |1-8| + |8-10| = 7 + 2 = 9.

In the third sample, as all elements are the same, the dissatisfaction score is already 0.

Example:
- `minimum_dissatisfaction_score(4, [2, 4, 1, 3]) == 3`

Implement `minimum_dissatisfaction_score(n: int, a: list[int]) -> int`.
