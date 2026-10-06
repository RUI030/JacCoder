"""
    This function takes the number of test cases and a list of strings representing the cave for each test case.
    It returns a list containing the length of the longest contiguous segment of empty cells for each test case.
    """
def longest_empty_segment(t: int, cases: list[str]) -> list[int] {
    results = [];
    for `case in cases {
        max_length = 0;
        current_length = 0;
        for char in `case {
            if (char == '.') {
                current_length += 1;
            } else {
                if (current_length > max_length) {
                    max_length = current_length;
                }
                current_length = 0;
            }
        }
        if (current_length > max_length) {
            max_length = current_length;
        }
        results.append(max_length);
    }
    return results;
}

