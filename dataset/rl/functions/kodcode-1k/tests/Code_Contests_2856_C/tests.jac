import from main { max_path_sum }

test "case 0" {
    want = 29;
    got = max_path_sum(3, 3, [[1, 2, 3], [4, 5, 6], [7, 8, 9]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -21;
    got = max_path_sum(3, 3, [[-1, -2, -3], [-4, -5, -6], [-7, -8, -9]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = max_path_sum(1, 1, [[1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = max_path_sum(2, 2, [[1, -1], [-1, 1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 12;
    got = max_path_sum(3, 3, [[1, 2, 3], [1, 2, 3], [1, 2, 3]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
