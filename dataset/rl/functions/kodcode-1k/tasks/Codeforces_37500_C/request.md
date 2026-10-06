# min_repairs

Calculate the minimum number of times the machine needs to be repaired.

Arguments:
m: int - number of fields
d: int - durability of the machine (maximum number of uses before repair)
plowing_needs: list of int - list where each value represents the number of times a field needs to be plowed

Returns:
int - minimum number of repairs needed

Examples:
>>> min_repairs(3, 5, [4, 3, 2])
1
>>> min_repairs(1, 5, [4])
0

Implement `min_repairs(m: int, d: int, plowing_needs: list[int]) -> int`.
