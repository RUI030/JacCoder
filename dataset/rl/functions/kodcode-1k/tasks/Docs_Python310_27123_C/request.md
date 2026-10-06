# process_data

Processes a list of elements that may contain integers or None.
Returns the sum of all integers in the list, skipping None values.
If the list is empty or contains only None values, returns 0.

>>> process_data([1, 2, None, 4, 5]) == 12
>>> process_data([None, None, None]) == 0

Implement `process_data(data: list[int | None]) -> int`.
