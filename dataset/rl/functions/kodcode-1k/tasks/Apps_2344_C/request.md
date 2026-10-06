# total_duration

Takes a list of integers representing durations in minutes and 
returns the total duration in the format "X hours Y minutes".

>>> total_duration([30, 45, 120, 180, 15]) == "6 hours 30 minutes"
>>> total_duration([60, 75, 80]) == "3 hours 55 minutes"

Implement `total_duration(durations: list[int]) -> str`.
