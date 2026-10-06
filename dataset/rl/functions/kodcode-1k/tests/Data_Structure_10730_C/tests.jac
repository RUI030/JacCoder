import from main { cycle_sort }

test "case 0" {
    want = [1, 2, 3, 4];
    got = cycle_sort([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4];
    got = cycle_sort([4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4];
    got = cycle_sort([4, 1, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 1, 2, 2, 3, 4, 4];
    got = cycle_sort([4, 2, 2, 4, 1, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-4, -3, -2, -1];
    got = cycle_sort([-4, -1, -3, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [-2, 0, 1, 3];
    got = cycle_sort([3, -2, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-1000000, 0, 500000, 1000000];
    got = cycle_sort([1000000, -1000000, 500000, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1];
    got = cycle_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
