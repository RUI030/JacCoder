import from main { max_equilateral_triangles }

test "case 0" {
    want = 0;
    got = max_equilateral_triangles(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = max_equilateral_triangles(6, [1, 1, 1, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = max_equilateral_triangles(8, [1, 1, 1, 2, 2, 2, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = max_equilateral_triangles(10, [1, 1, 1, 1, 1, 1, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = max_equilateral_triangles(9, [1, 1, 1, 1, 1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = max_equilateral_triangles(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
