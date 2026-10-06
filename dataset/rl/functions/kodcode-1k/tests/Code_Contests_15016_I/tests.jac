import from main { min_cost_to_equal_heights }

test "case 0" {
    want = 3;
    got = min_cost_to_equal_heights(5, [3, 1, 2, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 10;
    got = min_cost_to_equal_heights(3, [5, 9, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = min_cost_to_equal_heights(4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = min_cost_to_equal_heights(1, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 90;
    got = min_cost_to_equal_heights(6, [10, 20, 30, 40, 50, 60]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = min_cost_to_equal_heights(3, [5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = min_cost_to_equal_heights(1, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1000000000;
    got = min_cost_to_equal_heights(2, [0, 1000000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
