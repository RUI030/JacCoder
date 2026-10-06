import from main { has_subarray_with_sum }

test "case 0" {
    want = 'YES';
    got = has_subarray_with_sum(5, [1, 2, 3, 4, 5], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = has_subarray_with_sum(5, [1, 2, 3, 4, 5], 20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'NO';
    got = has_subarray_with_sum(5, [1, 2, 3, 4, 5], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = has_subarray_with_sum(5, [1, -1, 1, -1, 1], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = has_subarray_with_sum(3, [-1, -1, -1], -2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = has_subarray_with_sum(3, [-1, -1, -1], -3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'NO';
    got = has_subarray_with_sum(3, [-1, -1, -1], -5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
