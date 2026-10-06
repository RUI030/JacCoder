import from main { max_contiguous_subarray_sum }

test "case 0" {
    want = 21;
    got = max_contiguous_subarray_sum(8, 3, [5, 2, -1, 0, 3, 12, 6, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -3;
    got = max_contiguous_subarray_sum(4, 2, [-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = max_contiguous_subarray_sum(1, 1, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -6;
    got = max_contiguous_subarray_sum(5, 3, [-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 15;
    got = max_contiguous_subarray_sum(5, 5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = max_contiguous_subarray_sum(3, 4, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 12;
    got = max_contiguous_subarray_sum(10, 4, [1, 3, -2, 5, 2, -1, 6, 0, -4, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -2;
    got = max_contiguous_subarray_sum(6, 6, [-3, 4, -1, 2, 1, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
