import from main { minimize_absolute_difference }

test "case 0" {
    want = [1, 2, 3, 4];
    got = minimize_absolute_difference(4, [3, 2, 1, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 3, 5, 9, 10];
    got = minimize_absolute_difference(5, [10, 5, 3, 9, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [-4, -3, -2, -1];
    got = minimize_absolute_difference(4, [-1, -3, -2, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [-3, -2, -1, 0, 1, 2];
    got = minimize_absolute_difference(6, [-1, 0, 1, -2, 2, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-1000000000, 0, 1000000000];
    got = minimize_absolute_difference(3, [1000000000, -1000000000, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
