# is_robot_in_loop

A **robot** is initially located at position `(0, 0)` on an infinite 2D grid. The robot can move to the left, right, up, or down by exactly one step. The robot is given a sequence of instructions represented by a string `instructions`. Each instruction character can be 'L', 'R', 'U', or 'D', which stands for left, right, up, and down respectively. The robot might get stuck in a loop from which it can never escape, no matter what instructions follow. This happens if the robot's position returns to the starting point `(0, 0)` after following the sequence of instructions. Given a sequence of instructions, determine if the robot will be in a loop from which it can never escape. Return `true` if the robot is in an infinite loop and `false` otherwise.

Example:
- `is_robot_in_loop('') == True`

Implement `is_robot_in_loop(instructions: str) -> bool`.
