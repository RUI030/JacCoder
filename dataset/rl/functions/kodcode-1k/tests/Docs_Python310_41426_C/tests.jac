import from main { merge_sorted_lists }

test "case 0" {
    want = [1, 2, 3, 4, 5, 6, 7, 8];
    got = merge_sorted_lists([1, 3, 5, 7], [2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5, 6];
    got = merge_sorted_lists([1, 2, 3], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3];
    got = merge_sorted_lists([], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3];
    got = merge_sorted_lists([1, 2, 3], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = merge_sorted_lists([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 1, 2, 2, 3, 4];
    got = merge_sorted_lists([1, 1, 3], [2, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 1, 1, 2, 2, 3, 3, 3];
    got = merge_sorted_lists([1, 1, 2, 3], [1, 2, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 2, 3, 4, 5, 6, 7];
    got = merge_sorted_lists([1, 5], [2, 3, 4, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
