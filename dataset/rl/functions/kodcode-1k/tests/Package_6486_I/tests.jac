import from main { merge_sorted_arrays }

test "case 0" {
    want = [1, 2, 3, 4, 5, 6];
    got = merge_sorted_arrays([1, 3, 5], [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 4, 6];
    got = merge_sorted_arrays([], [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 3, 5];
    got = merge_sorted_arrays([1, 3, 5], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = merge_sorted_arrays([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5, 6];
    got = merge_sorted_arrays([1, 2, 3], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2];
    got = merge_sorted_arrays([1], [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2];
    got = merge_sorted_arrays([2], [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 1];
    got = merge_sorted_arrays([1], [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1, 2, 2, 2, 3];
    got = merge_sorted_arrays([1, 2, 2], [2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [1, 500, 1000, 1001];
    got = merge_sorted_arrays([1, 1000], [500, 1001]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = [-2, -1, 0, 1, 2, 3];
    got = merge_sorted_arrays([-1, 0, 1], [-2, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
