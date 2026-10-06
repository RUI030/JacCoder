import from main { cycle_sort }

test "case 0" {
    want = [1, 2, 3, 5, 8, 9];
    got = cycle_sort([8, 3, 2, 5, 9, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4, 4, 4, 4];
    got = cycle_sort([4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 1, 2, 2, 3, 3];
    got = cycle_sort([3, 3, 2, 2, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = cycle_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [100];
    got = cycle_sort([100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 4, 5];
    got = cycle_sort([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 1, 2, 2, 2, 4, 4, 5];
    got = cycle_sort([2, 4, 5, 2, 1, 4, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
