import from main { merge_sorted_lists }

test "case 0" {
    want = [1, 2, 3, 4, 5, 6];
    got = merge_sorted_lists([1, 3, 5], [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3];
    got = merge_sorted_lists([], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4, 5, 6];
    got = merge_sorted_lists([4, 5, 6], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 2, 3, 4, 5];
    got = merge_sorted_lists([1, 2, 4], [2, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2];
    got = merge_sorted_lists([1], [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2];
    got = merge_sorted_lists([2], [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 1, 2, 2, 3, 3];
    got = merge_sorted_lists([1, 2, 3], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-3, -2, -1, 0, 4, 5];
    got = merge_sorted_lists([-3, -1, 4], [-2, 0, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
