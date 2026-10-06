import from main { partitionArray }

test "case 0" {
    want = 1;
    got = partitionArray([1, 6, 11, 5], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 7;
    got = partitionArray([7], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = partitionArray([3, 3, 3, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 93;
    got = partitionArray([1, 2, 3, 99], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = partitionArray([10, 1, 9, 1, 8, 1, 7], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = partitionArray([2, 2, 2, 2], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
