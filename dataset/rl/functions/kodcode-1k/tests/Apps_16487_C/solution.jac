"""
    Check if shuff_str is a valid shuffle of str1 and str2.
    """
def is_valid_shuffle(str1: str, str2: str, shuff_str: str) -> bool {
    if ((len(str1) + len(str2)) != len(shuff_str)) {
        return False;
    }
    i = j=k=0;
    while (k < len(shuff_str)) {
        if ((i < len(str1)) and (str1[i] == shuff_str[k])) {
            i += 1;
        } elif ((j < len(str2)) and (str2[j] == shuff_str[k])) {
            j += 1;
        } else {
            return False;
        }
        k += 1;
    }
    return ((i == len(str1)) and (j == len(str2)));
}

