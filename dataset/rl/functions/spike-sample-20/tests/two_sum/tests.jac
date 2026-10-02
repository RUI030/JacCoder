import from main { two_sum }

test "no pair" {
    want = [];
    got = two_sum([1, 2, 3], 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "empty list" {
    want = [];
    got = two_sum([], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "negatives" {
    want = [0, 2];
    got = two_sum([-3, 4, 3, 90], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "duplicates" {
    want = [0, 1];
    got = two_sum([5, 5, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "smallest j wins" {
    want = [0, 1];
    got = two_sum([1, 8, 3, 6, 2], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "not same index twice" {
    want = [];
    got = two_sum([4, 1], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}
