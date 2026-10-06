"""
    Analyzes a list of integers and returns a dictionary where each key is an integer
    and each value is a tuple containing the binary representation of the integer
    and the count of ones in its binary representation.

    Parameters:
    integers (list): A list of integers.

    Returns:
    dict: A dictionary mapping each integer to a tuple with its binary representation
          and the count of ones in its binary representation.
    """
def analyze_bit_counts(integers: list[int]) -> dict[int, tuple[str, int]] {
    result = {};
    for num in integers {
        binary_representation = bin(num);
        one_count = binary_representation.count('1');
        if (num < 0) {
            one_count = bin(abs(num)).count('1');
        }
        result[num] = (binary_representation, one_count);
    }
    return result;
}

