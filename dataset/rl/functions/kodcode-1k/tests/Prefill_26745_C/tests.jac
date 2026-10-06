import from main { two_sum }

test "case 0" {
    want = [0, 1];
    got = two_sum([2, 7, 11, 15], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2];
    got = two_sum([3, 2, 4], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = two_sum([1, 2, 3], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 3];
    got = two_sum([0, 4, 3, 0], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 2];
    got = two_sum([-3, 4, 3, 90], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [0, 1];
    got = two_sum([3, 3], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}
