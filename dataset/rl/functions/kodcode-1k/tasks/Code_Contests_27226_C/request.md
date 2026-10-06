# max_full_flower_beds

This function calculates the maximum number of flower beds that can be fully occupied with flowers 
given the compatibility values of the soils.

n: int - number of different types of flowers
m: int - number of flower beds
compat_values: list of int - compatibility values of the soils

return: int - maximum number of fully occupied flower beds

>>> max_full_flower_beds(3, 3, [2, 1, 0])
3
>>> max_full_flower_beds(4, 2, [2, 2, 1, 0])
2

Implement `max_full_flower_beds(n: int, m: int, compat_values: list[int]) -> int`.
