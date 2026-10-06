import from main { replace_occurrences }

test "case 0" {
    want = [2, 2, 2, 2];
    got = replace_occurrences([1, 1, 1, 1], 1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4];
    got = replace_occurrences([1, 2, 3, 4], 5, 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 2, 3, 0, 2];
    got = replace_occurrences([1, 2, 3, 1, 2], 1, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = replace_occurrences([], 1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4];
    got = replace_occurrences([1, 2, 3, 4], 1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
