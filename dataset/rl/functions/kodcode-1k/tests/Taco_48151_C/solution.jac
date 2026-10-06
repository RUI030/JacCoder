"""
    Given a string of digits, find the smallest number that can be formed by removing at most one digit.
    """
def smallestNumber(num: str) -> str {
    n = len(num);
    if (n == 1) {
        return num;
    }
    for i in range((n - 1)) {
        if (num[i] > num[(i + 1)]) {
            return (num[:i] + num[(i + 1):]);
        }
    }
    return num[:-1];
}

