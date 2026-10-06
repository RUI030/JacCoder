import from main { min_operations_to_target }

test "case 0" {
    want = 0;
    got = min_operations_to_target([5, 5, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = min_operations_to_target([1, 2, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = min_operations_to_target([1, 2, 3], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = min_operations_to_target([-1, -2, -3], -3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = min_operations_to_target([-1, -2, -3], -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = min_operations_to_target([-1, 0, 1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = min_operations_to_target([-1, 0, 1], -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 294;
    got = min_operations_to_target([1, 2, 3], 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 250;
    got = min_operations_to_target([100, 200, 300], 150);
    assert got == want, f"expected={want!r} actual={got!r}";
}
