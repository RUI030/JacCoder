import from main { min_operations_to_crumble }

test "case 0" {
    want = 5;
    got = min_operations_to_crumble(3, [2, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 14;
    got = min_operations_to_crumble(5, [3, 1, 4, 1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = min_operations_to_crumble(1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 8;
    got = min_operations_to_crumble(4, [2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 25;
    got = min_operations_to_crumble(6, [1, 10, 2, 9, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
