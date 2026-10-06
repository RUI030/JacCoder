import from main { is_strictly_increasing }

test "case 0" {
    want = True;
    got = is_strictly_increasing(1, 2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_strictly_increasing(3, 5, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_strictly_increasing(1, 1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_strictly_increasing(3, 2, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_strictly_increasing(1, 2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_strictly_increasing(-3, -2, -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_strictly_increasing(-3, 0, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
