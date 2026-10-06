import from main { is_unique_sum_possible }

test "case 0" {
    want = 'NO';
    got = is_unique_sum_possible(5, [1, 1, 3, 3, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = is_unique_sum_possible(4, [1, 2, 4, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = is_unique_sum_possible(1, [100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = is_unique_sum_possible(3, [5, 10, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = is_unique_sum_possible(4, [7, 7, 14, 21]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
