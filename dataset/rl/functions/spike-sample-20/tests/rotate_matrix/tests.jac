import from main { rotate_matrix }

test "empty" {
    want = [];
    got = rotate_matrix([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "single cell" {
    want = [[7]];
    got = rotate_matrix([[7]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "three by three" {
    want = [[7, 4, 1], [8, 5, 2], [9, 6, 3]];
    got = rotate_matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "wide rectangle" {
    want = [[4, 1], [5, 2], [6, 3]];
    got = rotate_matrix([[1, 2, 3], [4, 5, 6]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "input untouched" {
    m = [[1, 2], [3, 4]];
    _ = rotate_matrix(m);
    want = [[1, 2], [3, 4]];
    got = m;
    assert got == want, f"expected={want!r} actual={got!r}";
}
