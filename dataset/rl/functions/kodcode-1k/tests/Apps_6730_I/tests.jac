import from main { max_sum_of_three_trees }

test "case 0" {
    want = 21;
    got = max_sum_of_three_trees(5, [8, 1, 9, -5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 15;
    got = max_sum_of_three_trees(4, [3, 7, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -10;
    got = max_sum_of_three_trees(4, [-3, -7, -2, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 20;
    got = max_sum_of_three_trees(6, [10, -1, 2, 6, -5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 12;
    got = max_sum_of_three_trees(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -6;
    got = max_sum_of_three_trees(3, [-1, -2, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 15;
    got = max_sum_of_three_trees(5, [5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1500;
    got = max_sum_of_three_trees(5, [-1000, 500, 1000, -500, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
