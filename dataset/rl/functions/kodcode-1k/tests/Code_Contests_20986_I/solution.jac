"""
    Generate the nth term in the Look-and-Say sequence starting from "1".
    """
def look_and_say(n: int) -> str {
    if (n == 1) {
        return "1";
    }
    term = "1";
    for _ in range(1, n) {
        next_term = "";
        i = 0;
        while (i < len(term)) {
            count = 1;
            while (((i + 1) < len(term)) and (term[i] == term[(i + 1)])) {
                i += 1;
                count += 1;
            }
            next_term += str(count) + term[i];
            i += 1;
        }
        term = next_term;
    }
    return term;
}

