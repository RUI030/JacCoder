import from main { is_isomorphic_advanced }

test "case 0" {
    want = True;
    got = is_isomorphic_advanced('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_isomorphic_advanced('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_isomorphic_advanced('egg', 'add');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_isomorphic_advanced('foo', 'bar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_isomorphic_advanced('a', 'ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_isomorphic_advanced('paper', 'title');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_isomorphic_advanced('ab', 'aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_isomorphic_advanced('abc', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_isomorphic_advanced('aa', 'ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_isomorphic_advanced('123', '456');
    assert got == want, f"expected={want!r} actual={got!r}";
}
