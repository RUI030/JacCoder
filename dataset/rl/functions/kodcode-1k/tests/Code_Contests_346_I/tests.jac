import from main { count_substring_occurrences }

test "case 0" {
    want = 3;
    got = count_substring_occurrences(3, 'abcd', 'd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = count_substring_occurrences(4, 'abac', 'ba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 12;
    got = count_substring_occurrences(3, 'aaaa', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = count_substring_occurrences(3, 'abcd', 'z');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = count_substring_occurrences(2, 'abcde', 'abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = count_substring_occurrences(2, 'abc', 'bcabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}
