# max_mountain_journey

In a faraway land, there is a popular game called "Mountain Journey". The game is played on a Cartesian plane with mountains represented as line segments parallel to the x-axis. The aim of the game is to find the longest possible journey over the mountains without crossing the same mountain segment more than once.

Given n mountains defined by their left and right endpoints, your task is to compute the maximum length of journey that can be achieved. Each mountain is represented by its left endpoint li and right endpoint ri such that li ≠ ri and li < ri.

The first line of input contains a single integer n (1 ≤ n ≤ 100,000) — the number of mountains. The next n lines contain two integers li and ri (1 ≤ li < ri ≤ 10^9) — the left and right endpoints of the ith mountain.

Output a single integer — the maximum length of the journey.

Example input:
4
1 5
2 6
4 9
7 10

Example output:
9

Explanation:
You can construct the longest journey by starting from the mountain segment (1, 5), then moving to the segment (2, 6), and finally moving to the segment (4, 9). The total length is then the total distance covered which is 5 (1 to 6) + 3 (6 to 9) = 9. Note that each segment is traversed only once and the journey is continuous over multiple segments.

Example:
- `max_mountain_journey([(1, 5)]) == 4`

Implement `max_mountain_journey(mountains: list[tuple[int, int]]) -> int`.
