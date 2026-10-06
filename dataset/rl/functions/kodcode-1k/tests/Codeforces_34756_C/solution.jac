def longest_palindrome_length(s: str) -> int {
    import from collections { Counter }
    char_count = Counter(s);
    length_of_palindrome = 0;
    odd_found = False;
    for count in char_count.values() {
        if ((count % 2) == 0) {
            length_of_palindrome += count;
        } else {
            length_of_palindrome += count - 1;
            odd_found = True;
        }
    }
    if odd_found {
        length_of_palindrome += 1;
    }
    return length_of_palindrome;
}

