import from main { minimize_reset_cost }

test "case 0" {
    want = 7;
    got = minimize_reset_cost([2, 4, 3, 5], 10, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = minimize_reset_cost([1, 1, 1, 1, 1], 2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 30;
    got = minimize_reset_cost([5, 5, 5, 5], 5, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = minimize_reset_cost([10], 10, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 32;
    got = minimize_reset_cost([5, 5, 5, 5, 5], 5, 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = minimize_reset_cost([2, 3, 1], 10, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
