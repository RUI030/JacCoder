import from main { max_diff_in_contiguous_subarray }

test "case 0" {
    want = 0;
    got = max_diff_in_contiguous_subarray([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = max_diff_in_contiguous_subarray([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 6;
    got = max_diff_in_contiguous_subarray([1, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = max_diff_in_contiguous_subarray([7, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = max_diff_in_contiguous_subarray([2, 3, 1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = max_diff_in_contiguous_subarray([-3, -2, -6, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 9;
    got = max_diff_in_contiguous_subarray([1, -2, 3, -4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = max_diff_in_contiguous_subarray([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = max_diff_in_contiguous_subarray([1, 5, 3, 1, 5, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
