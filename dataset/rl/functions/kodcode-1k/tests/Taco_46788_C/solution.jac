"""
    Determine the minimum number of operations required to make s1 a subsequence of s2.
    :param s1: String
    :param s2: String
    :return: Integer
    """
def min_operations_to_make_subsequence(s1: str, s2: str) -> int {
    len_s1 = len(s1);
    len_s2 = len(s2);
    (i, j) = (0, 0);
    while ((i < len_s1) and (j < len_s2)) {
        if (s1[i] == s2[j]) {
            i += 1;
        }
        j += 1;
    }
    if (i == len_s1) {
        return 0;
    } else {
        return (len_s1 - i);
    }
}

