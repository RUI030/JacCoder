import from main { intersection }

test "case 0" {
    want = [3];
    got = intersection([1, 2, 3], [3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = intersection([1, 2, 3], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3];
    got = intersection([1, 2, 3], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = intersection([1, 2, 3], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = intersection([], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = intersection([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [2];
    got = intersection([1, 2, 2, 3], [2, 2, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [2000002];
    got = intersection([1000001, 2000002], [2000002, 3000003]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
