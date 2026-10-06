# balance_bus_capacity

Charlie is trying to organize the city's bus routes more efficiently. The city has one main bus route which runs from the start point to the end point, consisting of n stops in a straight line. The i-th stop is characterized by its distance from the start si. Some segments of the route between consecutive stops are overcrowded with passengers, while others are underutilized. Charlie wants to balance the passenger load along the entire route by adding more buses on overcrowded segments and reducing them on underutilized ones.

For the i-th segment connecting stop i and stop i+1 (1 ≤ i < n), it has an initial bus capacity ci (number of passengers it can handle) and a passenger load pi (number of passengers currently using this segment).

Charlie's goal is to ensure that for every segment, the bus capacity should at least meet the passenger load. Specifically, you are required to adjust the capacity of each segment in a way that minimizes the total amount of increase in capacity across all segments.

You need to find the minimum total capacity increase required and the new capacities for each segment.

The first line contains a single integer n (2 ≤ n ≤ 100000) — the number of stops.

Each of the following n-1 lines contains two integers ci and pi (0 ≤ ci, pi ≤ 100000) — the current bus capacity and the number of passengers on the segment connecting stop i and stop i+1.

In the first line, print the minimum total capacity increase required.

In the second line, print n-1 integers c'1, c'2, ..., c'n-1 (ci ≤ c'i) — the new capacities of the segments from the first to the last.

If the initial capacities are already sufficient, print 0 in the first line, and in the second line, print the same capacities as provided in the input.

Example:
- `balance_bus_capacity(3, [(10, 5), (20, 15)]) == (0, [10, 20])`

Implement `balance_bus_capacity(n: int, segments: list[tuple[int, int]]) -> tuple[int, list[int]]`.
