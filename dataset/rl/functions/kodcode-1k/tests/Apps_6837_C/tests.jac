import from main { is_triangle }

test "case 0" {
    want = True;
    got = is_triangle(3, 4, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_triangle(7, 10, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_triangle(8, 15, 17);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_triangle(1, 1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_triangle(1, 2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_triangle(5, 5, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_triangle(2, 2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_triangle(2, 3, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = is_triangle(99999999, 99999998, 99999997);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_triangle(2, 9, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = is_triangle(1000000, 1000001, 1000002);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = is_triangle(1000000000, 1000000001, 1999999999);
    assert got == want, f"expected={want!r} actual={got!r}";
}
