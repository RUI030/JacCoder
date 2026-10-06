import from main { cycle_sort }

test "case 0" {
    want = [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9];
    got = cycle_sort([3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = cycle_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3];
    got = cycle_sort([3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = cycle_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1];
    got = cycle_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 3, 4, 4, 5];
    got = cycle_sort([4, 5, 4, 3, 3, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
