"""
    Determines if the robot is in an infinite loop.

    Parameters:
    instructions (str): String consisting of instructions ('L', 'R', 'U', 'D')

    Returns:
    bool: True if robot returns to (0, 0), False otherwise
    """
def is_robot_in_loop(instructions: str) -> bool {
    (x, y) = (0, 0);
    for instruction in instructions {
        if (instruction == 'L') {
            x -= 1;
        } elif (instruction == 'R') {
            x += 1;
        } elif (instruction == 'U') {
            y += 1;
        } elif (instruction == 'D') {
            y -= 1;
        }
    }
    return ((x == 0) and (y == 0));
}

