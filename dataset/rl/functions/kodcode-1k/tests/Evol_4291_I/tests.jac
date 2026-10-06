import from main { two_sum }

test "case 0" {
    want = (2, 7);
    got = two_sum([2, 7, 11, 15], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = None;
    got = two_sum([1, 2, 3, 4], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (3, 6);
    got = two_sum([1, 3, 2, 4, 6, 7], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (3, 3);
    got = two_sum([3, 3, 4, 7], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (1000000, 500000);
    got = two_sum([1000000, 500000, 1005000], 1500000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
