import from main { find_factors }

test "case 0" {
    want = [1, 13];
    got = find_factors(13);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 4, 7, 14, 28];
    got = find_factors(28);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4, 6, 9, 12, 18, 36];
    got = find_factors(36);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1];
    got = find_factors(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
