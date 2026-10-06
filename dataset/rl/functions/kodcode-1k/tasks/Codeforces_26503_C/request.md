# minimum_training_hours_per_day

Returns the minimum number of total training hours Emily needs to train per day to perfectly balance her schedule over `d` days.

:param d: Number of days
:param s: Total training hours required for swimming
:param c: Total training hours required for cycling
:param r: Total training hours required for running
:return: Minimum number of total training hours per day.

>>> minimum_training_hours_per_day(5, 10, 15, 20)
9
>>> minimum_training_hours_per_day(5, 0, 0, 0)
0

Implement `minimum_training_hours_per_day(d: int, s: int, c: int, r: int) -> int`.
