import from main { rectangle_area }

test "case 0" {
    want = 15;
    got = rectangle_area(5, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = rectangle_area(0, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = rectangle_area(5, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -12;
    got = rectangle_area(-4, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -12;
    got = rectangle_area(4, -3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 8;
    got = rectangle_area(-4, -2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
