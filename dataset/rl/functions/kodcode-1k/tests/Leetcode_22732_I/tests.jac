import from main { distinct_substrings }

test "case 0" {
    want = 6;
    got = distinct_substrings('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = distinct_substrings('aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 7;
    got = distinct_substrings('abab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = distinct_substrings('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = distinct_substrings('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
