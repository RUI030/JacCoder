import from main { rotate_matrix }

test "case 0" {
    want = [[7, 4, 1], [8, 5, 2], [9, 6, 3]];
    got = rotate_matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [[3, 1], [4, 2]];
    got = rotate_matrix([[1, 2], [3, 4]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [[1]];
    got = rotate_matrix([[1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [[13, 9, 5, 1], [14, 10, 6, 2], [15, 11, 7, 3], [16, 12, 8, 4]];
    got = rotate_matrix([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [[21, 16, 11, 6, 1], [22, 17, 12, 7, 2], [23, 18, 13, 8, 3], [24, 19, 14, 9, 4], [25, 20, 15, 10, 5]];
    got = rotate_matrix([[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15], [16, 17, 18, 19, 20], [21, 22, 23, 24, 25]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
