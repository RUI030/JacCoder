import from main { min_operations_to_make_elements_equal }

test "case 0" {
    want = 6;
    got = min_operations_to_make_elements_equal(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_operations_to_make_elements_equal(3, [10, 10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = min_operations_to_make_elements_equal(4, [1, 3, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 999999;
    got = min_operations_to_make_elements_equal(2, [1, 1000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = min_operations_to_make_elements_equal(6, [1, 3, 2, 2, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
