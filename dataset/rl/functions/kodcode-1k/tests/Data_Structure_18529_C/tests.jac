import from main { find_min_ignore_duplicates }

test "case 0" {
    want = 1;
    got = find_min_ignore_duplicates([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = find_min_ignore_duplicates([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = find_min_ignore_duplicates([4, 5, 6, 7, 0, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = find_min_ignore_duplicates([2, 3, 4, 5, 6, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = find_min_ignore_duplicates([3, 4, 5, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = find_min_ignore_duplicates([9, 12, 15, 18, 2, 5, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = find_min_ignore_duplicates([6, 7, 1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = find_min_ignore_duplicates([12, 14, 15, 17, 1, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
