# process_operations

Process a list of operations on the given list of integers.

Arguments:
values -- list of integers
operations -- list of operations to perform on values

Returns:
list of integers after performing all operations

>>> process_operations([1, 2, 3], ["add 2", "mul 3"])
[9, 12, 15]
>>> process_operations([4, 5, 6], ["delete 1", "insert 10 1"])
[4, 10, 6]

Implement `process_operations(values: list[int], operations: list[str]) -> list[int]`.
