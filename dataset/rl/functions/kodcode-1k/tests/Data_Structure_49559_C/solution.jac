def is_valid_markup(s: str) -> bool {
    stack = [];
    i = 0;
    n = len(s);
    while (i < n) {
        if (s[i:(i + 5)] == "<tag>") {
            stack.append("<tag>");
            i += 5;
        } elif (s[i:(i + 6)] == "</tag>") {
            if (not stack or (stack[-1] != "<tag>")) {
                return False;
            }
            stack.pop();
            i += 6;
        } elif (s[i:(i + 6)] == "[link]") {
            stack.append("[link]");
            i += 6;
        } elif (s[i:(i + 7)] == "[/link]") {
            if (not stack or (stack[-1] != "[link]")) {
                return False;
            }
            stack.pop();
            i += 7;
        } else {
            i += 1;
        }
    }
    return (len(stack) == 0);
}

