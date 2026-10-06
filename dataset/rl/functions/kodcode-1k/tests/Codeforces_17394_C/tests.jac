import from main { longest_subarray_bitwise_and_greater_than_zero }

test "case 0" {
    want = 1;
    got = longest_subarray_bitwise_and_greater_than_zero(1, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = longest_subarray_bitwise_and_greater_than_zero(1, [0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = longest_subarray_bitwise_and_greater_than_zero(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = longest_subarray_bitwise_and_greater_than_zero(7, [1, 2, 0, 4, 5, 0, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 5;
    got = longest_subarray_bitwise_and_greater_than_zero(5, [12, 13, 7, 5, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = longest_subarray_bitwise_and_greater_than_zero(3, [0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = longest_subarray_bitwise_and_greater_than_zero(6, [1, 0, 2, 0, 3, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
