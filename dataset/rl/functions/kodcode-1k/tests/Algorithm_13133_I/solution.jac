"""
    Removes all leading and trailing whitespace and specified special characters from the input_string.
    """
def sanitize_string(input_string: str, special_chars: str) -> str {
    if not input_string {
        return "";
    }
    remove_chars = `set(special_chars);
    start = 0;
    while (
        (start < len(input_string))
        and ((input_string[start] in remove_chars) or input_string[start].isspace())
    ) {
        start += 1;
    }
    end = len(input_string) - 1;
    while (
        (end >= 0)
        and ((input_string[end] in remove_chars) or input_string[end].isspace())
    ) {
        end -= 1;
    }
    if (start <= end) {
        return input_string[start:(end + 1)];
    } else {
        return "";
    }
}

