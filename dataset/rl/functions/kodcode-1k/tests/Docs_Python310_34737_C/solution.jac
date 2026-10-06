import re;
"""
    Validates an arithmetic expression to ensure it contains only valid characters,
    parentheses are balanced, and no consecutive operators are present.
    """
def validate_expression(expression: str) -> bool {
    expression = expression.replace(" ", "");
    if not re.match(r'^[\d\+\-\*\/\(\)]*$', expression) {
        return False;
    }
    stack = [];
    for char in expression {
        if (char == '(') {
            stack.append(char);
        } elif (char == ')') {
            if not stack {
                return False;
            }
            stack.pop();
        }
    }
    if stack {
        return False;
    }
    if re.search(
        r'\+\+|--|\*\*|//|\+\-|\-\+|\+\*|\+\*|\+\/|\-\/|\*\/|\/\*', expression
    ) {
        return False;
    }
    if re.search(r'[\+\-\*\/]{2,}', expression) {
        return False;
    }
    if (
        expression.startswith(('+', '-', '*', '/'))
        or expression.endswith(('+', '-', '*', '/'))
    ) {
        return False;
    }
    last_char = '';
    for (i, c) in enumerate(expression) {
        if ((c in '+-*/') and (last_char in '+-*/')) {
            return False;
        }
        last_char = c;
    }
    return True;
}

