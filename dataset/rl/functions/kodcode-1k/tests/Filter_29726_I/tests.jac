import from main { remove_below_average }

test "case 0" {
    want = [3, 4, 5];
    got = remove_below_average([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [3, 4];
    got = remove_below_average([-1, -2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [5, 5, 5, 5];
    got = remove_below_average([5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = remove_below_average([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [10];
    got = remove_below_average([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [10, 20, 30];
    got = remove_below_average([10, -10, 20, -20, 30, -30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
