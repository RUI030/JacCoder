# max_usages

Given battery capacities and device consumptions, calculate the maximum number of times
each device can be used in a row without recharging using the highest capacity battery.

:param n: Number of batteries
:param m: Number of devices
:param battery_capacities: List of integers representing battery capacities
:param device_consumptions: List of integers representing device consumptions
:return: List of integers representing the maximum number of usages for each device

Example:
- `max_usages(5, 3, [10, 20, 15, 30, 5], [3, 9, 6]) == [10, 3, 5]`

Implement `max_usages(n: int, m: int, battery_capacities: list[int], device_consumptions: list[int]) -> list[int]`.
