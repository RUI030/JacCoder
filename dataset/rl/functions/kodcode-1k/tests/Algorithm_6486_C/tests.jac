import from main { merge_sorted_lists }

test "case 0" {
    want = [1, 2, 3, 4, 5, 6];
    got = merge_sorted_lists([1, 3, 5], [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 2, 2, 2, 3];
    got = merge_sorted_lists([1, 2, 2], [2, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3];
    got = merge_sorted_lists([], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [4, 5];
    got = merge_sorted_lists([4, 5], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = merge_sorted_lists([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [-3, -2, -1, 0, 2, 3];
    got = merge_sorted_lists([-3, -1, 2], [-2, 0, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 1, 1, 1, 1, 1];
    got = merge_sorted_lists([1, 1, 1], [1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 2, 5, 9, 10];
    got = merge_sorted_lists([1, 5, 9, 10], [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1, 2];
    got = merge_sorted_lists([1], [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [1, 2];
    got = merge_sorted_lists([2], [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = [1, 2, 3, 4, 5, 6, 7, 8];
    got = merge_sorted_lists([1, 3, 5, 7], [2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
