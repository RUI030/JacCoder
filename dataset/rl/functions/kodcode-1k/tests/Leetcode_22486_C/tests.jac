import from main { max_distinct_substrings }

test "case 0" {
    want = 0;
    got = max_distinct_substrings('abc', 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = max_distinct_substrings('aaaaa', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = max_distinct_substrings('abcabcabc', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = max_distinct_substrings('abcdabc', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 12;
    got = max_distinct_substrings('abcdefghijklmnop', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
