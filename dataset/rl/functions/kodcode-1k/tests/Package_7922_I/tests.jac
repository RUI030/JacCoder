import from main { merge_sorted_arrays }

test "case 0" {
    want = [];
    got = merge_sorted_arrays([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3];
    got = merge_sorted_arrays([], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3];
    got = merge_sorted_arrays([1, 2, 3], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5, 6];
    got = merge_sorted_arrays([1, 3, 5], [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 4, 5, 7, 8];
    got = merge_sorted_arrays([1, 4, 7], [2, 5, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 3, 3, 4, 4, 5];
    got = merge_sorted_arrays([1, 3, 3, 5], [2, 3, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2];
    got = merge_sorted_arrays([2], [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 1, 1, 1, 1, 1];
    got = merge_sorted_arrays([1, 1, 1], [1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [-1000000000, -999999999, 0, 999999999, 1000000000];
    got = merge_sorted_arrays([-1000000000, 0, 1000000000], [-999999999, 999999999]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
