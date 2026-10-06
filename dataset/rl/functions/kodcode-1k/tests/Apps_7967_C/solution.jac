"""
    Returns "Palindromic" if the number reads the same forwards and backwards, otherwise "Not Palindromic".
    """
def palindromic_num(number: int) -> str {
    str_num = str(number);
    if (str_num == str_num[::-1]) {
        return "Palindromic";
    } else {
        return "Not Palindromic";
    }
}

