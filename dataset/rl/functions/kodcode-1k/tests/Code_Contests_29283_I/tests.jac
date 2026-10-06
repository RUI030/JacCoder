import from main { is_loading_possible }

test "case 0" {
    want = 'YES';
    got = is_loading_possible(3, 3, [10, 8, 5], [15, 12, 5], [2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = is_loading_possible(2, 2, [8, 10], [10, 12], [5, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = is_loading_possible(1, 3, [0], [10], [3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = is_loading_possible(1, 2, [8], [10], [1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = is_loading_possible(1, 1, [5], [5], [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = is_loading_possible(3, 4, [2, 4, 1], [5, 5, 5], [1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
