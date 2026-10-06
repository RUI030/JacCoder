import from main { max_points }

test "case 0" {
    want = [10, 8];
    got = max_points(2, [([3, 10], [2, 3, 5]), ([4, 8], [1, 2, 3, 4])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [8];
    got = max_points(1, [([4, 8], [5, 4, 3, 2])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0];
    got = max_points(1, [([3, 0], [2, 3, 5])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [10];
    got = max_points(1, [([3, 10], [1, 2, 7])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [11];
    got = max_points(1, [([5, 11], [3, 4, 2, 6, 5])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
