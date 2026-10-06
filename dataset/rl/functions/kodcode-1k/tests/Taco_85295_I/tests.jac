import from main { max_subarray_sum }

test "case 0" {
    want = 9;
    got = max_subarray_sum(5, [1, 2, 3, -2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = max_subarray_sum(4, [-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 7;
    got = max_subarray_sum(8, [-2, -3, 4, -1, -2, 1, 5, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = max_subarray_sum(1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -10;
    got = max_subarray_sum(1, [-10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = max_subarray_sum(5, [0, 0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
