import from main { count_valid_pairs }

test "case 0" {
    want = 3;
    got = count_valid_pairs(3, 7, [1, 2, 3], [6, 5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = count_valid_pairs(3, 10, [1, 2, 3], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = count_valid_pairs(4, 5, [1, 2, 3, 4], [4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = count_valid_pairs(3, 1000000000, [500000000, 500000001, 500000002], [500000000, 499999999, 499999998]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = count_valid_pairs(1, 0, [0], [0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = count_valid_pairs(1, 1, [0], [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = count_valid_pairs(1, 2, [1], [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = count_valid_pairs(1, 2, [0], [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
