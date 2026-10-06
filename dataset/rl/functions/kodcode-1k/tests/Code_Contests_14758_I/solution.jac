"""
    Determines the winner of the game between Alice and Bob based on the given rules.

    Parameters:
    n (int): The number of elements in the array.
    array (list of int): The array of integers.

    Returns:
    str: "Alice" if Alice wins, "Bob" if Bob wins.
    """
def determine_winner(n: int, array: list[int]) -> str {
    distinct_elements = len(`set(array));
    if (distinct_elements == 1) {
        return "Bob";
    } else {
        return "Alice";
    }
}

