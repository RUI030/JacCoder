import from main { largest_rectangle_area }

test "case 0" {
    want = 10;
    got = largest_rectangle_area([2, 1, 5, 6, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = largest_rectangle_area([2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = largest_rectangle_area([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = largest_rectangle_area([0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = largest_rectangle_area([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 9;
    got = largest_rectangle_area([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 9;
    got = largest_rectangle_area([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 12;
    got = largest_rectangle_area([6, 2, 5, 4, 5, 1, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
