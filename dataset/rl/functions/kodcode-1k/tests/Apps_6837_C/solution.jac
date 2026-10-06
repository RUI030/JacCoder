"""
    Determine if three side lengths can form a triangle based on the triangle inequality theorem.

    Parameters:
    a (int): The first side length.
    b (int): The second side length.
    c (int): The third side length.

    Returns:
    bool: True if the lengths can form a triangle, False otherwise.
    """
def is_triangle(a: int, b: int, c: int) -> bool {
    return (((a + b) > c) and ((a + c) > b) and ((b + c) > a));
}

