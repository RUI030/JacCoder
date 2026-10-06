import from main { is_zigzag }

test "case 0" {
    want = True;
    got = is_zigzag([4, 7, 3, 6, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_zigzag([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_zigzag([5, 1, 6, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_zigzag([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_zigzag([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_zigzag([10, 5, 10, 5, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_zigzag([10, 20, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_zigzag([-1, -2, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = is_zigzag([0, 1, -1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = is_zigzag([2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
