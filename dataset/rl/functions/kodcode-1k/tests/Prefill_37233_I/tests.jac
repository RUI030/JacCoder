import from main { is_subsequence }

test "case 0" {
    want = True;
    got = is_subsequence('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_subsequence('ace', 'abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_subsequence('aec', 'abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_subsequence('', 'anystring');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_subsequence('anystring', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_subsequence('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_subsequence('a', 'a long string');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_subsequence('z', 'a long string');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = is_subsequence('aaaa', 'aaabaaaabbbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}
