import from main { max_sum_non_adjacent }

test "case 0" {
    want = 15;
    got = max_sum_non_adjacent([3, 2, 5, 10, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 15;
    got = max_sum_non_adjacent([3, -2, 5, -1, 0, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = max_sum_non_adjacent([-3, -2, -5, -10, -7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = max_sum_non_adjacent([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = max_sum_non_adjacent([-5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 15;
    got = max_sum_non_adjacent([3, -2, 5, -1, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_sum_non_adjacent([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = max_sum_non_adjacent([3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = max_sum_non_adjacent([-3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 3;
    got = max_sum_non_adjacent([3, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 0;
    got = max_sum_non_adjacent([-3, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
