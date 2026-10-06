import from main { has_pair_with_abs_difference_k }

test "case 0" {
    want = 'YES';
    got = has_pair_with_abs_difference_k(5, [1, 3, 6, 9, 12], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = has_pair_with_abs_difference_k(4, [10, 20, 30, 40], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = has_pair_with_abs_difference_k(5, [1, 2, 0, 4, 5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = has_pair_with_abs_difference_k(3, [100, 200, 300], 50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = has_pair_with_abs_difference_k(6, [8, 1, 6, 3, 5, 10], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = has_pair_with_abs_difference_k(1, [10], 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'YES';
    got = has_pair_with_abs_difference_k(2, [1, 1000000000], 999999999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'YES';
    got = has_pair_with_abs_difference_k(7, [1, 2, 3, 4, 5, 6, 7], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'YES';
    got = has_pair_with_abs_difference_k(4, [1, 1, 1, 1], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'YES';
    got = has_pair_with_abs_difference_k(2, [999999999, 1000000000], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
