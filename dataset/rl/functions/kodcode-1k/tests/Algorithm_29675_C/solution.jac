"""
    Finds and returns the first duplicate value in the list.
    If no duplicate exists, returns -1.
    """
def find_duplicate(numbers: list[int]) -> int {
    seen = `set();
    for number in numbers {
        if (number in seen) {
            return number;
        }
        seen.add(number);
    }
    return -1;
}

