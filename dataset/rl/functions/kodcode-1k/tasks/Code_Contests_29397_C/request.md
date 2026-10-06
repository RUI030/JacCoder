# can_ball_pass

Determine if the ball can pass through the entire row of cylinders.

Parameters:
N (int): The number of cylinders.
heights (List[int]): The heights of the cylinders.
H (int): The initial height of the ball.
D (int): The maximum height difference the ball can handle between two consecutive cylinders.

Returns:
str: "Yes" if the ball can pass through the entire row, otherwise "No".

Example:
- `can_ball_pass(5, [2, 3, 1, 5, 4], 3, 1) == 'No'`

Implement `can_ball_pass(N: int, heights: list[int], H: int, D: int) -> str`.
