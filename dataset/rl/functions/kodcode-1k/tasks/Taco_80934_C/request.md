# is_valid_traffic

Determine if the traffic system is in a valid state.
Parameters:
- n (int): The number of intersections.
- m (int): The number of connections between intersections.
- signals (List[int]): A list of integers where the ith integer is 0 if the signal at 
  the ith intersection shows RED and 1 if it shows GREEN.
- connections (List[Tuple[int, int]]): A list of tuples where each tuple consists of two 
  integers indicating a road directly connecting two intersections.

Returns:
- str: "VALID" if the traffic system is in a valid state, otherwise "INVALID".

>>> is_valid_traffic(3, 2, [1, 0, 1], [(1, 2), (2, 3)])
"VALID"
>>> is_valid_traffic(4, 4, [1, 1, 0, 0], [(1, 2), (2, 3), (3, 4), (4, 1)])
"INVALID"

Implement `is_valid_traffic(n: int, m: int, signals: list[int], connections: list[tuple[int, int]]) -> str`.
