import from main { floyds_triangle }

test "case 0" {
    want = [[1]];
    got = floyds_triangle(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [[1], [2, 3]];
    got = floyds_triangle(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [[1], [2, 3], [4, 5, 6]];
    got = floyds_triangle(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [[1], [2, 3], [4, 5, 6], [7, 8, 9, 10]];
    got = floyds_triangle(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = floyds_triangle(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
