import from main { transpose_matrix }

test "case 0" {
    want = [[1]];
    got = transpose_matrix([[1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [[1, 3], [2, 4]];
    got = transpose_matrix([[1, 2], [3, 4]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [[1, 4], [2, 5], [3, 6]];
    got = transpose_matrix([[1, 2, 3], [4, 5, 6]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [[1, 3, 5], [2, 4, 6]];
    got = transpose_matrix([[1, 2], [3, 4], [5, 6]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [[5, 9], [8, 7], [-20, 3]];
    got = transpose_matrix([[5, 8, -20], [9, 7, 3]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = transpose_matrix([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [[1], [2], [3]];
    got = transpose_matrix([[1, 2, 3]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [[1, 2, 3]];
    got = transpose_matrix([[1], [2], [3]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
