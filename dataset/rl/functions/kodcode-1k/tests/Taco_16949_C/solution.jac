def smallest_lexicographical_string(K: int, S: str) -> str {
    if (K > 1) {
        return ''.join(sorted(S));
    }
    min_string = S;
    for i in range(len(S)) {
        for j in range((i + 1), (len(S) + 1)) {
            reversed_substring = S[:i] + S[i:j][::-1] + S[j:];
            if (reversed_substring < min_string) {
                min_string = reversed_substring;
            }
        }
    }
    return min_string;
}

