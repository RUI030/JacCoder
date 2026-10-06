import from main { max_sum_after_k_operations }

test "case 0" {
    want = [15];
    got = max_sum_after_k_operations(1, [((5, 2), [-1, 2, -3, 4, -5])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [15];
    got = max_sum_after_k_operations(1, [((5, 1), [1, 2, 3, 4, 5])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [15];
    got = max_sum_after_k_operations(1, [((5, 1), [-1, -2, -3, -4, -5])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [6, 15];
    got = max_sum_after_k_operations(2, [((3, 1), [-1, -2, 3]), ((5, 3), [-5, -4, -3, -2, -1])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [6];
    got = max_sum_after_k_operations(1, [((3, 0), [1, 2, 3])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
