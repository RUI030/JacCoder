import from main { transform_and_filter }

test "case 0" {
    want = [4, 16, 64, 100];
    got = transform_and_filter([4, -3, 2, -1, 0, 5, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [36, 196];
    got = transform_and_filter([3, 1, 7, 6, -6, 14, 9, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = transform_and_filter([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = transform_and_filter([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = transform_and_filter([1, 3, 5, 7, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [4, 36, 64];
    got = transform_and_filter([0, 1, 2, 3, -4, -5, 6, 8, -10, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [4, 16, 36, 64, 100];
    got = transform_and_filter([2, 4, 6, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [4, 16, 36, 64, 100];
    got = transform_and_filter([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
