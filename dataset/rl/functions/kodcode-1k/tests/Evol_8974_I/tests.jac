import from main { greater_than_mean }

test "case 0" {
    want = [];
    got = greater_than_mean([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4, 5];
    got = greater_than_mean([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = greater_than_mean([3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = greater_than_mean([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-1, -2];
    got = greater_than_mean([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = greater_than_mean([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [6, 7, 8, 4];
    got = greater_than_mean([1, 2, 3, 0, 6, 7, 8, -1, 4, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
