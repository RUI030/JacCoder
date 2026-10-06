def next_higher_number(num: int) -> int {
    digits = `list(str(num));
    n = len(digits);
    for i in range((n - 2), -1, -1) {
        if (digits[i] < digits[(i + 1)]) {
            break;
        }
    } else {
        return -1;
    }
    for j in range((n - 1), i, -1) {
        if (digits[j] > digits[i]) {
            break;
        }
    }
    (digits[i], digits[j]) = (digits[j], digits[i]);
    digits = digits[:(i + 1)] + sorted(digits[(i + 1):]);
    next_number = int(''.join(digits));
    return next_number if (next_number != num) else -1;
}

