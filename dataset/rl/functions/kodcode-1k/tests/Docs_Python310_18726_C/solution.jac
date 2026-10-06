import re;
def validate_string(input_string: str) -> bool {
    if ((len(input_string) < 4) or ((len(input_string) % 2) == 0)) {
        return False;
    }
    pattern = r'^[A-Z][a-z]*\d[a-z]{3}$';
    return bool(re.fullmatch(pattern, input_string));
}

