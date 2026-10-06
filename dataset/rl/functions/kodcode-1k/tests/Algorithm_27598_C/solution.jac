def is_balanced(s: str) -> bool {
    stack = [];
    bracket_map = {')': '(', ']': '[', '}': '{'};
    open_brackets = `set(bracket_map.values());
    for char in s {
        if (char in open_brackets) {
            stack.append(char);
        } elif (char in bracket_map) {
            if (not stack or (stack[-1] != bracket_map[char])) {
                return False;
            }
            stack.pop();
        }
    }
    return (len(stack) == 0);
}

