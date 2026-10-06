"""
    Returns the unique product ID that appears only once in the list of product IDs
    while every other ID appears exactly twice.
    """
def find_unique_product_id(product_ids: list[int]) -> int {
    unique_id = 0;
    for pid in product_ids {
        unique_id ^= pid;
    }
    return unique_id;
}

