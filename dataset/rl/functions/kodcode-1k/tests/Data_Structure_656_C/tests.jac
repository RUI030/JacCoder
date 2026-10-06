import from main { find_pair_with_sum }

test "case 0" {
    want = [1, 2];
    got = find_pair_with_sum([2, 7, 11, 15], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4, 5];
    got = find_pair_with_sum([1, 2, 3, 4, 6], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 3];
    got = find_pair_with_sum([2, 3, 4], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2];
    got = find_pair_with_sum([-1, 0], -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2];
    got = find_pair_with_sum([1, 2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = find_pair_with_sum([1, 2, 3, 4, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
