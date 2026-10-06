# daily_temperatures

Given a list of daily temperatures, return a list of how many days you would have to wait until 
a warmer temperature. If there is no such day, put 0.

>>> daily_temperatures([73, 74, 75, 71, 69, 72, 76, 73])
[1, 1, 4, 2, 1, 1, 0, 0]
>>> daily_temperatures([73])
[0]

Implement `daily_temperatures(temps: list[int]) -> list[int]`.
