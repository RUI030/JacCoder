import from main { intersection }

test "case 0" {
    want = [4, 9];
    got = intersection([4, 9, 5], [9, 4, 9, 8, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = intersection([1, 2, 3], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2];
    got = intersection([1, 2, 2, 1], [2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = intersection([], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = intersection([4, 5, 6], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = intersection([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-3, -2, -1];
    got = intersection([-1, -2, -3], [-3, -2, -1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [2];
    got = intersection([1, 1, 2, 2], [2, 2, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1000000002];
    got = intersection([1000000001, 1000000002], [1000000002, 1000000003]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
