import from main { merge_sorted_arrays }

test "case 0" {
    want = [1, 2, 3, 4, 5, 6];
    got = merge_sorted_arrays([1, 3, 5], [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0, 1, 2, 4, 5, 7];
    got = merge_sorted_arrays([0, 2, 4], [1, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 3, 5];
    got = merge_sorted_arrays([], [1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [2, 2, 2];
    got = merge_sorted_arrays([2, 2, 2], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = merge_sorted_arrays([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2];
    got = merge_sorted_arrays([1], [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [2, 2, 2, 2, 2, 2];
    got = merge_sorted_arrays([2, 2, 2], [2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
