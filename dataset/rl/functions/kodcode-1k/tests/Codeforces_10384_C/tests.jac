import from main { two_sum_sorted }

test "case 0" {
    want = (3, 4);
    got = two_sum_sorted([1, 2, 4, 4, 5], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (-1, -1);
    got = two_sum_sorted([1, 2, 3, 4, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (1, 2);
    got = two_sum_sorted([-10, -5, 1, 2, 4, 4, 5], -15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (4, 5);
    got = two_sum_sorted([1, 2, 3, 4, 5], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (1, 2);
    got = two_sum_sorted([1, 10], 11);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = (-1, -1);
    got = two_sum_sorted([1, 2, 5, 6], 18);
    assert got == want, f"expected={want!r} actual={got!r}";
}
