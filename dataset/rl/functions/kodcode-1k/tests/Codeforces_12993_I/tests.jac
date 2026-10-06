import from main { subarray_sum_exists }

test "case 0" {
    want = 'YES';
    got = subarray_sum_exists(5, 10, [4, 3, -2, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = subarray_sum_exists(3, 8, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = subarray_sum_exists(4, -6, [-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = subarray_sum_exists(5, 1000000, [999999, 1, -1, 1, -999999]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = subarray_sum_exists(5, 0, [1, 2, -3, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = subarray_sum_exists(1, 5, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'YES';
    got = subarray_sum_exists(1, 0, [0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'YES';
    got = subarray_sum_exists(1, -5, [-5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'NO';
    got = subarray_sum_exists(1, 5, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'NO';
    got = subarray_sum_exists(6, 15, [1, 1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
