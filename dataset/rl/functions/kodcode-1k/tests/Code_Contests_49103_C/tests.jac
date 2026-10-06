import from main { does_subarray_with_zero_sum_exist }

test "case 0" {
    want = 'Yes';
    got = does_subarray_with_zero_sum_exist([4, 2, -3, 1, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'No';
    got = does_subarray_with_zero_sum_exist([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Yes';
    got = does_subarray_with_zero_sum_exist([1, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Yes';
    got = does_subarray_with_zero_sum_exist([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Yes';
    got = does_subarray_with_zero_sum_exist([1, 2, -2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'No';
    got = does_subarray_with_zero_sum_exist([-1, -1, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'No';
    got = does_subarray_with_zero_sum_exist([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Yes';
    got = does_subarray_with_zero_sum_exist([1, 2, 3, -5, 5, -1, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
