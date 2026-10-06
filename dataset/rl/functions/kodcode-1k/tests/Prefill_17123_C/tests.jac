import from main { max_subarray_sum }

test "case 0" {
    want = 1;
    got = max_subarray_sum([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = max_subarray_sum([-1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 6;
    got = max_subarray_sum([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = max_subarray_sum([-1, -2, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = max_subarray_sum([1, -3, 2, 1, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = max_subarray_sum([-2, 1, -3, 4, -1, 2, 1, -5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_subarray_sum([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 6;
    got = max_subarray_sum([4, -1, 2, 1, -5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 12;
    got = max_subarray_sum([8, -7, 3, 5, -2, 1, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
