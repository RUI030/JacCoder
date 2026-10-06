# min_operations_to_reduce_stacks

Returns the minimum number of operations to reduce the number of stacks to exactly k.

Args:
n (int): The number of stacks.
k (int): The desired number of stacks.
coins (List[int]): A list of integers representing the number of coins in each stack.

Returns:
int: The minimum number of operations required to achieve exactly k stacks.

Examples:
>>> min_operations_to_reduce_stacks(4, 2, [3, 5, 2, 1])
3
>>> min_operations_to_reduce_stacks(1, 1, [10])
0

Implement `min_operations_to_reduce_stacks(n: int, k: int, coins: list[int]) -> int`.
