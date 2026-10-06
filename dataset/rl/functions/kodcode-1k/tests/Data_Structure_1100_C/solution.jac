def next_bigger_number(num: int) -> int {
    digits = `list(str(num));
    n = len(digits);
    i = n - 2;
    while ((i >= 0) and (digits[i] >= digits[(i + 1)])) {
        i -= 1;
    }
    if (i == -1) {
        return -1;
    }
    j = n - 1;
    while (digits[j] <= digits[i]) {
        j -= 1;
    }
    (digits[i], digits[j]) = (digits[j], digits[i]);
    digits = digits[:(i + 1)] + digits[(i + 1):][::-1];
    return int(''.join(digits));
}

