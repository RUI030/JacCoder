import from main { length_of_lis }

test "case 0" {
    want = 4;
    got = length_of_lis([10, 22, 9, 33, 21, 50, 41]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = length_of_lis([3, 10, 2, 1, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = length_of_lis([2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = length_of_lis([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = length_of_lis([42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = length_of_lis([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = length_of_lis([6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = length_of_lis([10, 5, 18, 7, 2, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
