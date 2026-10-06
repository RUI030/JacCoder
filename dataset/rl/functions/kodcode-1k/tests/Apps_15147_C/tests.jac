import from main { min_operations_to_make_equal }

test "case 0" {
    want = 6;
    got = min_operations_to_make_equal([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = min_operations_to_make_equal([5, 7, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = min_operations_to_make_equal([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 8;
    got = min_operations_to_make_equal([4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 6;
    got = min_operations_to_make_equal([10000, 10000, 10000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 12;
    got = min_operations_to_make_equal([1, 1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
