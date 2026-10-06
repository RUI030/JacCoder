import from main { find_pairs }

test "case 0" {
    want = [(2, 3), (1, 4)];
    got = find_pairs([1, 2, 3, 2, 3, 4], 5, -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(2, 3), (1, 4)];
    got = find_pairs([1, 2, 3, 2, 3, 4], 5, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = find_pairs([], 5, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = find_pairs([1], 5, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(1, 4)];
    got = find_pairs([1, 4, 2, 3], 5, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = find_pairs([1, 2, 3], 7, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [(2, 3), (1, 4)];
    got = find_pairs([1, 2, 2, 3, 3, 4], 5, -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
