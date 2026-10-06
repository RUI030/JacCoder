def validate_username(username: str) -> str {
    import re;
    if not re.match(r'^[a-z]+$', username) {
        return "Invalid";
    }
    if not (6 <= len(username) <= 15) {
        return "Invalid";
    }
    if re.search(r'(.)\1\1', username) {
        return "Invalid";
    }
    for i in range((len(username) - 3)) {
        if (
            (ord(username[(i + 1)]) == (ord(username[i]) + 1))
            and (ord(username[(i + 2)]) == (ord(username[(i + 1)]) + 1))
            and (ord(username[(i + 3)]) == (ord(username[(i + 2)]) + 1))
        ) {
            return "Invalid";
        }
    }
    for i in range((len(username) - 3)) {
        if (
            (ord(username[(i + 1)]) == (ord(username[i]) - 1))
            and (ord(username[(i + 2)]) == (ord(username[(i + 1)]) - 1))
            and (ord(username[(i + 3)]) == (ord(username[(i + 2)]) - 1))
        ) {
            return "Invalid";
        }
    }
    return "Valid";
}

