"""
    Determine if the given list follows an XOR sequence pattern based on the initial value and the xor_value.
    """
def is_xor_sequence(initial_value: int, xor_value: int, sequence: list[int]) -> bool {
    current_value = initial_value;
    for number in sequence {
        if (number != current_value) {
            return False;
        }
        current_value ^= xor_value;
    }
    return True;
}

