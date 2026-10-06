import from main { min_operations_to_reduce_stacks }

test "case 0" {
    want = 3;
    got = min_operations_to_reduce_stacks(4, 2, [3, 5, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_operations_to_reduce_stacks(1, 1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = min_operations_to_reduce_stacks(4, 2, [5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = min_operations_to_reduce_stacks(3, 3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 100;
    got = min_operations_to_reduce_stacks(2, 1, [100, 101]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 10;
    got = min_operations_to_reduce_stacks(6, 3, [2, 3, 5, 8, 13, 21]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
