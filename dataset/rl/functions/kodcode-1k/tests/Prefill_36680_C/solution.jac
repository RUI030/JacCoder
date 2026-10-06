"""
    Returns the average of the numbers in the list. If the list is empty, return None.
    """
def average(numbers: list[float]) -> float | None {
    if not numbers {
        return None;
    }
    return (sum(numbers) / len(numbers));
}

