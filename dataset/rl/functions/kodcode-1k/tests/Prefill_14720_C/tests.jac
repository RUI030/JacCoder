import from main { sum_lists }

test "case 0" {
    want = [5, 7, 9];
    got = sum_lists([1, 2, 3], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5, 7, 9];
    got = sum_lists([1, 2, 3, 4], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [5, 7, 9];
    got = sum_lists([1, 2, 3], [4, 5, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = sum_lists([], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = sum_lists([1, 2, 3], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = sum_lists([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [3];
    got = sum_lists([1], [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
