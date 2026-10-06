import from main { min_operations_to_equalize }

test "case 0" {
    want = 6;
    got = min_operations_to_equalize([1, 5, 5, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = min_operations_to_equalize([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = min_operations_to_equalize([5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = min_operations_to_equalize([10, 10, 10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = min_operations_to_equalize([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = min_operations_to_equalize([3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 18;
    got = min_operations_to_equalize([7, 1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
