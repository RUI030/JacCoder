import from main { cycle_sort }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = cycle_sort([4, 3, 2, 1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 3, 3, 4, 4];
    got = cycle_sort([4, 3, 3, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1];
    got = cycle_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = cycle_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    got = cycle_sort([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = cycle_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-5, -4, -3, -2, -1];
    got = cycle_sort([-1, -3, -2, -5, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
