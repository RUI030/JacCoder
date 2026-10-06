# max_continuous_green_time

The city's traffic department is planning to optimize the traffic lights at various intersections to reduce the overall commute time for drivers. They are particularly focusing on a stretch of road with n intersections, each having a traffic light. The time intervals for green lights at these intersections are given as a sequence of integers t[1], t[2], ..., t[n], where t[i] indicates the duration in seconds for which the i-th intersection stays green before it turns red.

To make this work, the department wants to calculate the maximum possible time a driver can continuously drive through green lights without stopping. Note that while calculating, if a driver can drive through two consecutive green lights without stopping (i.e., the green light duration at one intersection ends exactly when the green light duration at the next intersection starts), those durations can be summed up to get the continuous green light duration. However, driving time cannot be considered continuous if the green lights do not align as per the above condition.

You have been given the task to write a program that determines this maximum continuous green light driving time.

Input Format:
- The first line contains a single integer n (the number of intersections).
- The second line contains n space-separated integers t[1], t[2], ..., t[n] (the green light durations at the intersections).

Output Format:
- Output a single integer: the maximum possible continuous time in seconds a driver can drive through green lights without stopping.

Constraints:
- 2 ≤ n ≤ 100
- 1 ≤ t[i] ≤ 1000

Sample Input:
4
10 20 10 30

Sample Output:
30

Explanation:
- The first intersection has a green light for 10 seconds, then it switches to red while the second intersection has just turned green for 20 seconds.
- After 20 seconds, the light at the second intersection turns red, and at that exact time, the green light 10 seconds for the third intersection starts.
- However, the green light durations do not align at the second and third intersections. 
- The longest possible continuous green light time is therefore 30 seconds (either the second or the fourth intersection).

Example:
- `max_continuous_green_time(4, [10, 20, 10, 30]) == 30`

Implement `max_continuous_green_time(n: int, times: list[int]) -> int`.
