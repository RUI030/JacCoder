import from main { can_transform }

test "case 0" {
    want = True;
    got = can_transform('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = can_transform('abc', 'abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = can_transform('abc', 'cba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = can_transform('abcd', 'dcba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = can_transform('abc', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = can_transform('aabbcc', 'ccbbaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = can_transform('abc', 'abd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = can_transform('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = can_transform('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = can_transform('a', 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}
