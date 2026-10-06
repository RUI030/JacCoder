import from main { triangle_area }

test "case 0" {
    want = 25.0;
    got = triangle_area(10, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 75.0;
    got = triangle_area(15, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0.0;
    got = triangle_area(0, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0.0;
    got = triangle_area(5, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -25.0;
    got = triangle_area(-10, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -25.0;
    got = triangle_area(10, -5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 25.0;
    got = triangle_area(-10, -5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
