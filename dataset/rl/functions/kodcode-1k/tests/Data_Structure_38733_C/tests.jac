import from main { cycle_sort }

test "case 0" {
    want = [1, 2, 3, 4];
    got = cycle_sort([4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 5, 6, 9];
    got = cycle_sort([5, 6, 1, 2, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1];
    got = cycle_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 2, 3, 4, 4, 5];
    got = cycle_sort([4, 5, 4, 3, 2, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5];
    got = cycle_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 4, 5];
    got = cycle_sort([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-1000000, -500000, 0, 500000, 1000000];
    got = cycle_sort([-1000000, 1000000, 0, 500000, -500000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-6, -3, -1, 2, 4, 5];
    got = cycle_sort([-1, 2, -3, 4, 5, -6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
