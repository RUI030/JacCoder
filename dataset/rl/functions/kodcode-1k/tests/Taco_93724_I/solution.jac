"""
    Returns the total number of blocks needed to add to make all blocks of the same height as the tallest block.

    Parameters:
    n (int): The number of blocks.
    heights (list of int): The heights of the blocks.

    Returns:
    int: The total number of blocks to add.
    """
def total_blocks_to_add(n: int, heights: list[int]) -> int {
    max_height = max(heights);
    total_adds = sum((max_height - height) for height in heights);
    return total_adds;
}

