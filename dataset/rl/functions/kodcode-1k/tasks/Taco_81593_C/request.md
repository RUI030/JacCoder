# min_total_time

Determines the minimum total time required to produce at least K units of each product.

Parameters:
N (int): Number of products
M (int): Number of machines
K (int): Units of each product required
P (list): Time required to produce a single unit of each product

Returns:
int: The minimum total time required

>>> min_total_time(3, 2, 4, [1, 2, 3])
12
>>> min_total_time(3, 3, 4, [1, 2, 3])
12

Implement `min_total_time(N: int, M: int, K: int, P: list[int]) -> int`.
