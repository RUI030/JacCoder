# simulate_balloon_falls

You are given a list of `numRows` integers representing the number of balloons in each row of a grid. Each balloon can be shot directly downward from its position. If a balloon in row `i` in column `j` is shot, it will fall down to row `i+1` in the same column `j`. If a balloon reaches the bottom row, it cannot fall further. Implement a function that simulates shooting all balloons from the top row to the bottom row. Return the final state of the grid as a list of integers where each element represents the number of balloons in each row after the simulation is complete.

Example:
- `simulate_balloon_falls([]) == []`

Implement `simulate_balloon_falls(numRows: list[int]) -> list[int]`.
