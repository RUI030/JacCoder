"""
    Finds the length of the longest substring where all characters are the same.
    """
def longest_repeating_substring(input_string: str) -> int {
    if not input_string {
        return 0;
    }
    max_length = 1;
    current_length = 1;
    n = len(input_string);
    for i in range(1, n) {
        if (input_string[i] == input_string[(i - 1)]) {
            current_length += 1;
        } else {
            max_length = max(max_length, current_length);
            current_length = 1;
        }
    }
    return max(max_length, current_length);
}

