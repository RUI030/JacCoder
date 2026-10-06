import from main { max_subarray_with_k_distinct }

test "case 0" {
    want = 13;
    got = max_subarray_with_k_distinct(7, 3, [1, 2, 1, 2, 3, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 9;
    got = max_subarray_with_k_distinct(5, 2, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 25;
    got = max_subarray_with_k_distinct(5, 1, [5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = max_subarray_with_k_distinct(4, 4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 100;
    got = max_subarray_with_k_distinct(1, 1, [100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 9;
    got = max_subarray_with_k_distinct(6, 2, [1, 2, 1, 2, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
