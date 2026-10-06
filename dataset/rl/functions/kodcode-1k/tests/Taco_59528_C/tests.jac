import from main { find_unsorted_subarray }

test "case 0" {
    want = (-1, -1);
    got = find_unsorted_subarray([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (1, 5);
    got = find_unsorted_subarray([2, 6, 4, 8, 10, 9, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (0, 4);
    got = find_unsorted_subarray([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (-1, -1);
    got = find_unsorted_subarray([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (1, 4);
    got = find_unsorted_subarray([1, 3, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = (-1, -1);
    got = find_unsorted_subarray([1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
