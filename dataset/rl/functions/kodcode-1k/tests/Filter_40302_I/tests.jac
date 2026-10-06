import from main { ostrich_escape }

test "case 0" {
    want = True;
    got = ostrich_escape(10, [], [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = ostrich_escape(10, [6, 7, 8, 9], [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = ostrich_escape(10, [2, 4, 6], [1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = ostrich_escape(10, [2, 4, 6], [1, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = ostrich_escape(10, [1, 2, 3, 4, 5], [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
