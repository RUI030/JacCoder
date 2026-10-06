# longest_increasing_subsequence

## Task
Joey needs to help his friend organize a line-up of athletes for a relay race. Each athlete has a unique strength score and can only pass the baton to another athlete with a higher score. Joey wants to know the longest sequence of athletes that can be organized in this manner.

-----Input:-----
- The first line contains a single integer N, the number of athletes.
- The second line contains N space-separated integers representing the strength scores of the athletes.

-----Output:-----
Print a single integer, denoting the length of the longest sequence of athletes that can be organized where each athlete's strength score is strictly greater than the previous athlete's score.

-----Constraints-----
- 1 ≤ N ≤ 10^5
- 1 ≤ strength score ≤ 10^9

-----Sample Input:-----
6
10 20 10 30 20 50

-----Sample Output:-----
4

-----Note:-----
- In the sample set, the longest sequence of athletes that can be selected in order is 10 -> 20 -> 30 -> 50, which has a length of 4.

Example:
- `longest_increasing_subsequence([10, 20, 10, 30, 20, 50]) == 4`

Implement `longest_increasing_subsequence(arr: list[int]) -> int`.
