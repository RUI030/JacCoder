def find_nth_digit(n: int) -> int {
    length = 1;
    count = 9;
    start = 1;
    while (n > (length * count)) {
        n -= length * count;
        length += 1;
        count *= 10;
        start *= 10;
    }
    start += (n - 1) // length;
    number_str = str(start);
    digit_index = (n - 1) % length;
    return int(number_str[digit_index]);
}

