import from main { min_operations_to_strictly_increasing }

test "case 0" {
    want = 0;
    got = min_operations_to_strictly_increasing([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_operations_to_strictly_increasing([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = min_operations_to_strictly_increasing([5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = min_operations_to_strictly_increasing([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = min_operations_to_strictly_increasing([3, 1, 2, 1, 3, 2, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = min_operations_to_strictly_increasing([1000000000, -1000000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = min_operations_to_strictly_increasing([1, 3, 2, 4, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = min_operations_to_strictly_increasing([1, 2, 2, 3, 4, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
