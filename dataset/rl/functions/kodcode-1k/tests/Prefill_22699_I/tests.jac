import from main { sum_with_next }

test "case 0" {
    want = [];
    got = sum_with_next([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5, 5];
    got = sum_with_next([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [3, 2];
    got = sum_with_next([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [3, 5, 7, 4];
    got = sum_with_next([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [6, 10, 14, 8];
    got = sum_with_next([2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [-3, -5, -7, -4];
    got = sum_with_next([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, -1, 1, 4];
    got = sum_with_next([-1, 2, -3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
