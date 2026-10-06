# climb_stairs_custom

Calculate the number of ways to reach the top of a staircase with given steps.

:param steps: int - number of steps to reach the top
:param allowed_steps: List[int] - list of allowed steps that can be climbed at a time
:return: int - number of distinct ways to reach the top

>>> climb_stairs_custom(5, [1, 2])
8
>>> climb_stairs_custom(3, [1, 3, 5])
2

Implement `climb_stairs_custom(steps: int, allowed_steps: list[int]) -> int`.
