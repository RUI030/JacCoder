import from main { generate_pascals_triangle }

test "case 0" {
    want = [];
    got = generate_pascals_triangle(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [[1]];
    got = generate_pascals_triangle(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [[1], [1, 1]];
    got = generate_pascals_triangle(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [[1], [1, 1], [1, 2, 1]];
    got = generate_pascals_triangle(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]];
    got = generate_pascals_triangle(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
