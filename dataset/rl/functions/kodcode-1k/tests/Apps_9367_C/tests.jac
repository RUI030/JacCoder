import from main { find_smallest_missing_positive_integer }

test "case 0" {
    want = 1;
    got = find_smallest_missing_positive_integer([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = find_smallest_missing_positive_integer([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = find_smallest_missing_positive_integer([3, 4, -1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = find_smallest_missing_positive_integer([-1, -2, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = find_smallest_missing_positive_integer([1, 1, 2, 2, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = find_smallest_missing_positive_integer([7, 8, 9, 11, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
