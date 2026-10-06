import from main { longest_subarray_with_distinct_elements }

test "case 0" {
    want = 3;
    got = longest_subarray_with_distinct_elements([2, 1, 2, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_subarray_with_distinct_elements([4, 2, 4, 5, 6, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = longest_subarray_with_distinct_elements([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = longest_subarray_with_distinct_elements([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = longest_subarray_with_distinct_elements([1, 2, 3, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = longest_subarray_with_distinct_elements([7, 3, 7, 3, 1, 4, 6, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = longest_subarray_with_distinct_elements([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
