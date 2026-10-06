import from main { find_max_in_bitonic }

test "case 0" {
    want = 12;
    got = find_max_in_bitonic([1, 3, 8, 12, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = find_max_in_bitonic([1, 2, 3, 4, 5, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 9;
    got = find_max_in_bitonic([1, 3, 5, 7, 9, 8, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = find_max_in_bitonic([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = find_max_in_bitonic([2, 3, 4, 5, 6, 7, 8, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = find_max_in_bitonic([5, 5, 5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = find_max_in_bitonic([0, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 10;
    got = find_max_in_bitonic([10, 10, 9, 8, 7, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = find_max_in_bitonic([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
