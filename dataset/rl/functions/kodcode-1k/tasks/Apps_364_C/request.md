# check_plan

Checks if the given plan supports the required number of concurrent streams.

:param plan: The subscription plan (Basic, Standard, Premium).
:param num_streams: The number of concurrent streams the user wants.
:return: True if the plan supports the number of concurrent streams, False otherwise.

>>> check_plan("Standard", 2)
True
>>> check_plan("Basic", 2)
False

Implement `check_plan(plan: str, num_streams: int) -> bool`.
