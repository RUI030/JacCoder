"""
    Returns a new dictionary with only the key-value pairs where the values are integers.

    Parameters:
    d (dict): The input dictionary

    Returns:
    dict: A dictionary containing only key-value pairs with integer values
    """
def filter_integers(d: dict[str, int]) -> dict[str, int] {
    return {
        k: v
        for (k, v) in d.items()
        if isinstance(v, int)
    };
}

