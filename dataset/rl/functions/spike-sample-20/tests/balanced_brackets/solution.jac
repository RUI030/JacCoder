def balanced_brackets(s: str) -> bool {
    pairs: dict[str, str] = {")": "(", "]": "[", "}": "{"};
    stack: list[str] = [];
    for ch in s {
        if ch in "([{" {
            stack.append(ch);
        } elif ch in pairs {
            if not stack or stack.pop() != pairs[ch] {
                return False;
            }
        }
    }
    return len(stack) == 0;
}
