import from main { max_occurrences }

test "case 0" {
    want = 6;
    got = max_occurrences('aaaaaa', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = max_occurrences('abcde', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = max_occurrences('ababcabc', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = max_occurrences('abcd', 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = max_occurrences('abcd', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = max_occurrences('abcd', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = max_occurrences('abcd', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
