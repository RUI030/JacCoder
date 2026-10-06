import from main { numDistinct }

test "case 0" {
    want = 3;
    got = numDistinct('rabbbit', 'rabbit');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = numDistinct('babgbag', 'bag');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = numDistinct('abcde', 'ace');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = numDistinct('abcdef', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = numDistinct('', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = numDistinct('aaa', 'aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}
