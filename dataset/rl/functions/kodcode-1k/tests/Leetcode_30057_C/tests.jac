import from main { removeKchars }

test "case 0" {
    want = 'abc';
    got = removeKchars('abcde', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'abd';
    got = removeKchars('acbd', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'abd';
    got = removeKchars('acbd', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'aabc';
    got = removeKchars('abcdabcd', 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = removeKchars('a', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = removeKchars('abc', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'babc';
    got = removeKchars('bcabc', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'abc';
    got = removeKchars('bcabc', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
