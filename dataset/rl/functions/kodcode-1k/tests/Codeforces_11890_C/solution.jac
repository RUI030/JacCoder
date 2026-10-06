"""
    Returns the product of two non-negative integers represented as strings.
    """
def multiply_strings(num1: str, num2: str) -> str {
    if ((num1 == "0") or (num2 == "0")) {
        return "0";
    }
    result = [0] * (len(num1) + len(num2));
    num1 = num1[::-1];
    num2 = num2[::-1];
    for i in range(len(num1)) {
        for j in range(len(num2)) {
            product = int(num1[i]) * int(num2[j]);
            result[(i + j)] += product;
            result[(i + j + 1)] += result[(i + j)] // 10;
            result[(i + j)] %= 10;
        }
    }
    while (result[-1] == 0) {
        result.pop();
    }
    return ''.join(map(str, result[::-1]));
}

