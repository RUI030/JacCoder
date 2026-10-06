import from main { find_smallest_missing_positive }

test "case 0" {
    want = 5;
    got = find_smallest_missing_positive(5, [1, 3, 6, 4, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = find_smallest_missing_positive(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = find_smallest_missing_positive(4, [-1, -3, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = find_smallest_missing_positive(1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = find_smallest_missing_positive(1, [-1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = find_smallest_missing_positive(5, [2, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 6;
    got = find_smallest_missing_positive(7, [1, 2, 3, 4, 5, 7, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = find_smallest_missing_positive(5, [-5, -4, -3, -2, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = find_smallest_missing_positive(6, [1, 2, 3, 5, 6, 1000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
