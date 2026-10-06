import from main { max_usages }

test "case 0" {
    want = [10, 3, 5];
    got = max_usages(5, 3, [10, 20, 15, 30, 5], [3, 9, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4, 1];
    got = max_usages(4, 2, [8, 16, 12, 4], [4, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [10];
    got = max_usages(1, 1, [100], [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [4, 2];
    got = max_usages(3, 2, [20, 20, 20], [5, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0];
    got = max_usages(3, 1, [10, 10, 10], [30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [10, 5];
    got = max_usages(3, 2, [1000000000, 500000000, 750000000], [100000000, 200000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
