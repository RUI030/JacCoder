# longest_alternating_subsequence

You are given a list of integers. Your task is to determine the length of the longest subsequence that adheres to the following alternating property: For any two adjacent elements in the subsequence, the following conditions hold — either the first element is even and the second is odd, or the first is odd and the second is even.

Input:
- The first line of the input contains an integer n (1 ≤ n ≤ 10^5) — the number of elements in the list.
- The second line contains n integers a1, a2, ..., an (1 ≤ ai ≤ 10^9) — the elements of the list.

Output:
- Output a single integer — the length of the longest alternating subsequence.

Example:
Input:
6
1 2 3 4 5 6

Output:
6

Explanation:
One possible longest alternating subsequence is [1, 2, 3, 4, 5, 6]. This sequence alternates between odd and even elements. Another possible alternating subsequence of the same length is [2, 3, 4, 5, 6, 1], starting with an even element and followed by an odd element.

Example:
- `longest_alternating_subsequence([1, 2, 3, 4, 5, 6]) == 6`

Implement `longest_alternating_subsequence(arr: list[int]) -> int`.
