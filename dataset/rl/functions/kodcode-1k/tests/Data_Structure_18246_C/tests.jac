import from main { is_isomorphic }

test "case 0" {
    want = True;
    got = is_isomorphic('egg', 'add');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_isomorphic('foo', 'bar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_isomorphic('paper', 'title');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_isomorphic('abc', 'de');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_isomorphic('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_isomorphic('123', '321');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_isomorphic('ab@!', 'cd$%');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_isomorphic('a1b2c3', 'x9y8z7');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_isomorphic('ab', 'cc');
    assert got == want, f"expected={want!r} actual={got!r}";
}
