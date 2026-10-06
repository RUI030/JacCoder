import from main { generate_spiral_matrix }

test "case 0" {
    want = [[1]];
    got = generate_spiral_matrix(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [[1, 2], [4, 3]];
    got = generate_spiral_matrix(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [[1, 2, 3], [8, 9, 4], [7, 6, 5]];
    got = generate_spiral_matrix(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [[1, 2, 3, 4], [12, 13, 14, 5], [11, 16, 15, 6], [10, 9, 8, 7]];
    got = generate_spiral_matrix(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [[1, 2, 3, 4, 5], [16, 17, 18, 19, 6], [15, 24, 25, 20, 7], [14, 23, 22, 21, 8], [13, 12, 11, 10, 9]];
    got = generate_spiral_matrix(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
