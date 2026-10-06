import from main { max_triangle_perimeter }

test "case 0" {
    want = 12;
    got = max_triangle_perimeter([2, 3, 4, 5, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = max_triangle_perimeter([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 12;
    got = max_triangle_perimeter([2, 3, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 150;
    got = max_triangle_perimeter([100, 1, 1, 50, 50, 50]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 18;
    got = max_triangle_perimeter([5, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 24;
    got = max_triangle_perimeter([8, 5, 2, 9, 3, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = max_triangle_perimeter([1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
