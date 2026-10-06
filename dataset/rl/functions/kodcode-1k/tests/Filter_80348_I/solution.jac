"""
    Returns the average of a list of numbers. If the list is empty, returns 0.
    """
def calculate_average(numbers: list[int]) -> float {
    if not numbers {
        return 0;
    }
    return (sum(numbers) / len(numbers));
}

