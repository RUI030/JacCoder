import from main { pigeonhole_sort }

test "case 0" {
    want = [-10, -5, -3, -1, 0, 5, 8, 10];
    got = pigeonhole_sort([-5, -10, 0, -3, 8, 5, -1, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [-1, -1, -1, 0, 0, 0, 1, 1, 1];
    got = pigeonhole_sort([1, 1, 1, 0, 0, 0, -1, -1, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = pigeonhole_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [5];
    got = pigeonhole_sort([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-3, -2, -1, 0, 1, 2, 3];
    got = pigeonhole_sort([-3, -2, -1, 0, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [-3, -2, -1, 0, 1, 2, 3];
    got = pigeonhole_sort([3, 2, 1, 0, -1, -2, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [4, 4, 4, 4, 4];
    got = pigeonhole_sort([4, 4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
