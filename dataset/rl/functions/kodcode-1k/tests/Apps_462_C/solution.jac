"""
    Converts the given string to camel case.
    """
def toCamelCase(s: str) -> str {
    if not s {
        return "";
    }
    words = s.replace("-", " ").replace("_", " ").split();
    if not words {
        return "";
    }
    camel_case = words[0].lower();
    for word in words[1:] {
        camel_case += word.capitalize();
    }
    return camel_case;
}

