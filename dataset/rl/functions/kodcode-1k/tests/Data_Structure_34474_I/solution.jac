def is_isomorphic(s: str, t: str) -> bool {
    if (len(s) != len(t)) {
        return False;
    }
    s_to_t = {};
    t_to_s = {};
    for (char_s, char_t) in zip(s, t) {
        if (char_s in s_to_t) {
            if (s_to_t[char_s] != char_t) {
                return False;
            }
        }
        if (char_t in t_to_s) {
            if (t_to_s[char_t] != char_s) {
                return False;
            }
        }
        s_to_t[char_s] = char_t;
        t_to_s[char_t] = char_s;
    }
    return True;
}

