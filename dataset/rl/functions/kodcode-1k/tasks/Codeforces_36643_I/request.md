# count_valid_subarrays

Dasha and Masha are playing a game with a sequence of integers. They have a list of n integers and a sliding window of size k that Dasha and Masha use to explore the array. Their goal is to find subarrays within the window of size k that contain at least one even and one odd number.

Every integer in the list is either even or odd. The sliding window starts from the first element and moves one position to the right at a time until it reaches the end of the array.

Your task is to count the number of valid subarrays within each sliding window of size k that contain both even and odd numbers.

The input consists of two integers n and k (1 ≤ n ≤ 100000, 1 ≤ k ≤ n) — the number of integers in the list and the size of the sliding window, followed by a list of n integers (1 ≤ elements in the list ≤ 10^9).

The output should be a single integer — the number of valid subarrays in the window of size k that contain both an even and an odd number.

For example:

Input:
10 3
1 2 3 4 5 6 7 8 9 10

Output:
8

In the sample input, there are 8 valid subarrays of size 3 that contain both even and odd numbers.

Example:
- `count_valid_subarrays(10, 3, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) == 8`

Implement `count_valid_subarrays(n: int, k: int, array: list[int]) -> int`.
