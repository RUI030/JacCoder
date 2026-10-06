import from main { can_partition_into_equal_groups }

test "case 0" {
    want = True;
    got = can_partition_into_equal_groups([3, 3, 3, 3, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = can_partition_into_equal_groups([3, 3, 3, 3, 2, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = can_partition_into_equal_groups([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = can_partition_into_equal_groups([2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = can_partition_into_equal_groups([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = can_partition_into_equal_groups([1, 1, 2, 2, 2, 2, 3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = can_partition_into_equal_groups([1, 1, 2, 2, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = can_partition_into_equal_groups([4, 4, 4, 4, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = can_partition_into_equal_groups([1, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
