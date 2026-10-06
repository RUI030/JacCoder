import from main { find_missing }

test "case 0" {
    want = 0;
    got = find_missing([1, 1, 2, 3, 5, 8, 13, 21]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = find_missing([1, 2, 3, 5, 8, 13, 21, 34]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 8;
    got = find_missing([1, 1, 2, 3, 5, 13, 21, 34]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 89;
    got = find_missing([2, 3, 5, 8, 13, 21, 34, 55, 144]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = find_missing([1, 4, 5, 9, 14]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 55;
    got = find_missing([5, 8, 13, 21, 34, 89]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = find_missing([1, 1, 2, 4, 6, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
