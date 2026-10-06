import from main { merge_sorted_arrays }

test "case 0" {
    want = [1, 2, 3, 4, 5, 6];
    got = merge_sorted_arrays([1, 3, 5], [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5, 6];
    got = merge_sorted_arrays([1, 2, 3], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2, 4, 6];
    got = merge_sorted_arrays([], [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 3, 5];
    got = merge_sorted_arrays([1, 3, 5], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 1, 3, 3, 5, 5];
    got = merge_sorted_arrays([1, 3, 5], [1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 2, 2, 2, 3];
    got = merge_sorted_arrays([1, 2, 2], [2, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2];
    got = merge_sorted_arrays([1], [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 2];
    got = merge_sorted_arrays([2], [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1, 2, 3, 4, 5, 6, 7, 8];
    got = merge_sorted_arrays([1, 3], [2, 4, 5, 6, 7, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [2, 3, 4, 5, 6, 7, 8];
    got = merge_sorted_arrays([2, 4, 5, 6, 7, 8], [3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
