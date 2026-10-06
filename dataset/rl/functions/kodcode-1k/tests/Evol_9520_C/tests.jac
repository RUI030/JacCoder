import from main { find_pairs }

test "case 0" {
    want = [(2, 5), (3, 4)];
    got = find_pairs([2, 4, 3, 5, 7], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = find_pairs([1, 2, 3], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(4, 5)];
    got = find_pairs([1, 2, 3, 4, 5], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [(2, 4)];
    got = find_pairs([1, 3, 2, 2, 4, 4], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(1, 7), (2, 6), (3, 5)];
    got = find_pairs([1, 2, 3, 4, 3, 6, 5, 7, 8], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}
