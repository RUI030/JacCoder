import from main { cycle_sort }

test "case 0" {
    want = [1, 2, 3, 4];
    got = cycle_sort([4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 3, 4];
    got = cycle_sort([4, 3, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [-2, -1, 2, 3, 4];
    got = cycle_sort([-1, 4, 3, -2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1];
    got = cycle_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5];
    got = cycle_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = cycle_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-5, -1, 0, 1, 2, 3, 4];
    got = cycle_sort([0, -1, 3, 2, -5, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
