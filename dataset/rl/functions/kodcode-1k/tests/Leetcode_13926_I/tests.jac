import from main { min_moves_to_alternate }

test "case 0" {
    want = 0;
    got = min_moves_to_alternate('ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_moves_to_alternate('ba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = min_moves_to_alternate('abab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = min_moves_to_alternate('baba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = min_moves_to_alternate('aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = min_moves_to_alternate('bb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = min_moves_to_alternate('aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = min_moves_to_alternate('bbbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = min_moves_to_alternate('aab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 1;
    got = min_moves_to_alternate('baa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 2;
    got = min_moves_to_alternate('abba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 0;
    got = min_moves_to_alternate('ababab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 0;
    got = min_moves_to_alternate('bababab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 0;
    got = min_moves_to_alternate('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 0;
    got = min_moves_to_alternate('b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 0;
    got = min_moves_to_alternate('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
