import from main { max_subarray_sum }

test "case 0" {
    want = 15;
    got = max_subarray_sum([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = max_subarray_sum([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 6;
    got = max_subarray_sum([-2, 1, -3, 4, -1, 2, 1, -5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = max_subarray_sum([3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -3;
    got = max_subarray_sum([-3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = max_subarray_sum([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = max_subarray_sum([0, -1, 2, -3, 0, 4, -1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
