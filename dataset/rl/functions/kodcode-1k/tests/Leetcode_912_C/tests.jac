import from main { min_absolute_sum_difference }

test "case 0" {
    want = 0;
    got = min_absolute_sum_difference([1, 2, 3], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = min_absolute_sum_difference([1, 3, 5], [4, 2, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 12;
    got = min_absolute_sum_difference([-1, -2, -3], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = min_absolute_sum_difference([5], [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = min_absolute_sum_difference([5], [3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = min_absolute_sum_difference([1000, -2000, 3000], [1000, -2000, 3000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = min_absolute_sum_difference([1000, -2000, 3000], [1000, -2000, 2999]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
