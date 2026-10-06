import from main { subset_sum_exists }

test "case 0" {
    want = 'YES';
    got = subset_sum_exists(5, 9, [2, 3, 7, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = subset_sum_exists(3, 0, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'NO';
    got = subset_sum_exists(5, 1, [2, 3, 7, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = subset_sum_exists(3, 10, [1, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = subset_sum_exists(4, 15, [3, 2, 7, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = subset_sum_exists(5, 6, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'YES';
    got = subset_sum_exists(3, 1000, [999, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'YES';
    got = subset_sum_exists(1, 1000, [1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'NO';
    got = subset_sum_exists(1, 1000, [999]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'YES';
    got = subset_sum_exists(5, 15, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
