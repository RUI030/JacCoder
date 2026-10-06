"""
    Finds the first Fibonacci number that contains the given substring.

    :param substring: A string representing the substring to search for within the Fibonacci numbers
    :return: The first Fibonacci number that contains the given substring
    """
def find_first_fibonacci_with_substring(substring: str) -> int {
    (a, b) = (0, 1);
    while True {
        if (substring in str(a)) {
            return a;
        }
        (a, b) = (b, (a + b));
    }
}

