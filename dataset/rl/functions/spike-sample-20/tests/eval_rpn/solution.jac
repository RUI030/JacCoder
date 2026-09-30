def eval_rpn(tokens: list[str]) -> int {
    stack: list[int] = [];
    for tok in tokens {
        if tok in ["+", "-", "*", "/"] {
            b = stack.pop();
            a = stack.pop();
            if tok == "+" {
                stack.append(a + b);
            } elif tok == "-" {
                stack.append(a - b);
            } elif tok == "*" {
                stack.append(a * b);
            } else {
                stack.append(int(a / b));
            }
        } else {
            stack.append(int(tok));
        }
    }
    return stack[0];
}
