# max_magic_power

Determines the maximum magic power that can be collected by picking stones in an alternating color pattern.

Parameters:
- n (int): The number of stones.
- stones (list of tuples): A list where each tuple contains a string representing the color and an integer 
  representing the magic power of the stone.

Returns:
- int: The maximum magic power that can be collected.

Example:
>>> max_magic_power(5, [("red", 5), ("blue", 10), ("red", 15), ("blue", 20), ("green", 25)])
75
>>> max_magic_power(1, [("red", 10)])
10

Implement `max_magic_power(n: int, stones: list[tuple[str, int]]) -> int`.
