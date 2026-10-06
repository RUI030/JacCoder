def find_mismatched_parentheses(input_string: str) -> int {
    open_count = 0;
    close_count = 0;
    for char in input_string {
        if (char == '(') {
            open_count += 1;
        } elif (char == ')') {
            if (open_count > 0) {
                open_count -= 1;
            } else {
                close_count += 1;
            }
        }
    }
    return (open_count + close_count);
}

