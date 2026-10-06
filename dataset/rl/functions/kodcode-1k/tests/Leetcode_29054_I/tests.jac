import from main { find_pair_with_sum }

test "case 0" {
    want = [0, 3];
    got = find_pair_with_sum([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 4];
    got = find_pair_with_sum([1, 2, 3, 4, 5], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 4];
    got = find_pair_with_sum([-5, -3, 0, 2, 4], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [-1, -1];
    got = find_pair_with_sum([1, 2, 3, 4, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-1, -1];
    got = find_pair_with_sum([1, 3, 5, 7], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [0, 3];
    got = find_pair_with_sum([-5, -4, -3, -2, -1], -7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-1, -1];
    got = find_pair_with_sum([], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-1, -1];
    got = find_pair_with_sum([2], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [0, 1];
    got = find_pair_with_sum([1000000000, 2000000000], 3000000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
