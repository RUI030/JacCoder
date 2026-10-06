import from main { min_operations_to_equal_elements }

test "case 0" {
    want = 3;
    got = min_operations_to_equal_elements(4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_operations_to_equal_elements(5, [5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = min_operations_to_equal_elements(3, [1, 100, 1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = min_operations_to_equal_elements(6, [4, 4, 4, 4, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = min_operations_to_equal_elements(1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
