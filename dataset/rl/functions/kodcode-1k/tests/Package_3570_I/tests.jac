import from main { find_most_frequent_char }

test "case 0" {
    want = ('a', 1);
    got = find_most_frequent_char('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ('a', 3);
    got = find_most_frequent_char('AaA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ('a', 2);
    got = find_most_frequent_char(' a a  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ('.', 6);
    got = find_most_frequent_char('...,!!!...');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ('a', 2);
    got = find_most_frequent_char('abc123321cba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ('a', 2);
    got = find_most_frequent_char('abcabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ('t', 3);
    got = find_most_frequent_char('This is a test');
    assert got == want, f"expected={want!r} actual={got!r}";
}
