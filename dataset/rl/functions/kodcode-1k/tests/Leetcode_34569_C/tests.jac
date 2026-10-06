import from main { max_swaps_to_balance }

test "case 0" {
    want = 0;
    got = max_swaps_to_balance([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = max_swaps_to_balance([2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = max_swaps_to_balance([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = max_swaps_to_balance([2, 1, 4, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = max_swaps_to_balance([1, 1, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = max_swaps_to_balance([2, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_swaps_to_balance([10, 5, 10, 5, 10, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = max_swaps_to_balance([1, 3, 2, 4, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
