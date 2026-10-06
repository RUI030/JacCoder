import from main { min_operations_to_equalize }

test "case 0" {
    want = 6;
    got = min_operations_to_equalize([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_operations_to_equalize([2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 16;
    got = min_operations_to_equalize([1, 10, 2, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 9;
    got = min_operations_to_equalize([6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = min_operations_to_equalize([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = min_operations_to_equalize([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 999999999;
    got = min_operations_to_equalize([1000000000, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
