"""
    Determines if two strings s and t are isomorphic.
    """
def is_isomorphic_advanced(s: str, t: str) -> bool {
    if (len(s) != len(t)) {
        return False;
    }
    mapping_s_t = {};
    mapping_t_s = {};
    for (char_s, char_t) in zip(s, t) {
        if (
            ((char_s in mapping_s_t) and (mapping_s_t[char_s] != char_t))
            or ((char_t in mapping_t_s) and (mapping_t_s[char_t] != char_s))
        ) {
            return False;
        }
        mapping_s_t[char_s] = char_t;
        mapping_t_s[char_t] = char_s;
    }
    return True;
}

