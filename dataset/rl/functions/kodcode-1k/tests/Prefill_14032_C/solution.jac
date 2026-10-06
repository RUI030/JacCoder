"""
    Transforms the string 's' into uppercase if its length is at least 5 characters.
    Returns an error message if the string is shorter than 5 characters.
    """
def transform_string(s: str) -> str {
    if (len(s) < 5) {
        return "Error: String is too short.";
    }
    return s.upper();
}

