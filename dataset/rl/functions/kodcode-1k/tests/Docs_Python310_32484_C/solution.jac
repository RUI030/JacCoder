"""
    Checks if the given expression is valid, following the specified grammar.
    """
def is_valid_expression(expression: str) -> bool {
    import re;
    pattern = r'^[\d+\-*/().\s]+$';
    if not re.match(pattern, expression) {
        return False;
    }
    try {
        eval(expression, {"__builtins__": None}, {});
    } except Exception as e {
        return False;
    }
    return True;
}

