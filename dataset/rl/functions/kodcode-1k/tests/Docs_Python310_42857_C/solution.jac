"""
    Finds the largest integer in the list.
    """
def find_largest(numbers: list[int]) -> int {
    largest = numbers[0];
    for number in numbers {
        if (number > largest) {
            largest = number;
        }
    }
    return largest;
}

