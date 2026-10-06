import from main { can_transform }

test "case 0" {
    want = True;
    got = can_transform('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = can_transform('abc', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = can_transform('a', 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = can_transform('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = can_transform('abcdx', 'wxyzj');
    assert got == want, f"expected={want!r} actual={got!r}";
}
