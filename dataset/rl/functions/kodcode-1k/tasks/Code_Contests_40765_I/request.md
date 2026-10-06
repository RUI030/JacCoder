# max_distance

A car purposefully drives in a straight line down a flat country road. The car starts at position 0 and drives for n days. The car can either move forward or backward by a specified distance each day. 

You are given a list of distances the car drives each day. On the i-th day, the car drives a distance of d_i units, where d_i can be positive (forward) or negative (backward). Compute the maximum distance from the starting point the car can be after the n-th day, considering any number of forward or backward moves each day.

Input

The first line of the input contains one integer n (1 ≤ n ≤ 1000) — the number of days.
The second line contains n integers, the list of distances d_i (|d_i| ≤ 1000).

Output

Print one integer — the maximum distance from the starting point the car can be after n days.

Example

Input

5
10 -5 7 -8 12

Output

30

Explanation

If the car moves forward by all positive distances and backward by all negative distances, the farthest point the car can move from the starting point is calculated as: 10 + 7 + 12 + | -5 | + | -8 | = 30.

Example:
- `max_distance(5, [10, 5, 7, 8, 12]) == 42`

Implement `max_distance(n: int, distances: list[int]) -> int`.
