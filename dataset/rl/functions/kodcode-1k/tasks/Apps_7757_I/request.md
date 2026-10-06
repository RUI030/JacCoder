# daily_temperatures

You are given a list of integers that represents the daily temperatures over a span of days. For each day, you want to know how many days you would have to wait until a warmer temperature. If there is no future day with a warmer temperature, put 0 in the result for that day.

Your task is to implement a function that calculates the number of days one has to wait until a warmer temperature for each day.

-----Input:-----
- An integer $N$ representing the number of days.
- A list of $N$ integers, where each integer represents the temperature of a day.

-----Output:-----
- A list of $N$ integers where the value at each index $i$ is the number of days you have to wait until a warmer temperature. If no such day exists, the value should be 0.

-----Constraints-----
- $1 \leq N \leq 1000$
- $30 \leq temperature \leq 100$

-----Sample Input:-----
8

73 74 75 71 69 72 76 73

-----Sample Output:-----
1 1 4 2 1 1 0 0

-----EXPLANATION:-----
For the first day (temperature 73), the next warmer day is the second day (temperature 74), so you have to wait 1 day. For the second day (temperature 74), the next warmer day is the third day (temperature 75), so you have to wait 1 day. For the third day (temperature 75), the next warmer day is the seventh day (temperature 76), so you have to wait 4 days. The values for the rest of the days are calculated similarly, with days that do not have a future warmer temperature receiving a 0 in the result.

Example:
- `daily_temperatures(8, [73, 74, 75, 71, 69, 72, 76, 73]) == [1, 1, 4, 2, 1, 1, 0, 0]`

Implement `daily_temperatures(N: int, temperatures: list[int]) -> list[int]`.
