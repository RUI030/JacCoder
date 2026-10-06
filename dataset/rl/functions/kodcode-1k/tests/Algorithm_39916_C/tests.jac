import from main { find_unique_pairs }

test "case 0" {
    want = [(1, 4), (2, 3)];
    got = find_unique_pairs([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(1, 5)];
    got = find_unique_pairs([3, 1, 4, 1, 5], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(1, 1)];
    got = find_unique_pairs([1, 1, 1, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = find_unique_pairs([], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(-30, 30), (-20, 20), (-10, 10)];
    got = find_unique_pairs([10, -10, 20, -20, 30, -30, 0], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [(-4, -1), (-3, -2)];
    got = find_unique_pairs([-1, -2, -3, -4, -5], -5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [(1, 3), (2, 2)];
    got = find_unique_pairs([1, 1, 2, 2, 3, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [(1, 3)];
    got = find_unique_pairs([1, 1, 1, 3, 3, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
