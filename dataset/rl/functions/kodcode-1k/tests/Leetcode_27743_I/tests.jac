import from main { find_subarray_with_target }

test "case 0" {
    want = 3;
    got = find_subarray_with_target([1, 2, 3, 4, 5], 9, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = find_subarray_with_target([1, 2, 3, 4, 5], 5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = find_subarray_with_target([1, 2, 3, 4, 5], 12, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = find_subarray_with_target([1, 2, 3, 4, 5], 15, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = find_subarray_with_target([1, 2, 3, 4, 5], 11, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = find_subarray_with_target([1, 2], 5, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = find_subarray_with_target([], 1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -1;
    got = find_subarray_with_target([1, 2, 3], 7, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = find_subarray_with_target([4], 4, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = -1;
    got = find_subarray_with_target([4], 5, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = find_subarray_with_target([-1, -2, -3], -5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
