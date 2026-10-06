import from main { min_coins }

test "case 0" {
    want = 3;
    got = min_coins(11, [1, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = min_coins(3, [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = min_coins(0, [1, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = min_coins(1, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = min_coins(6, [3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = min_coins(10, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 7;
    got = min_coins(7, [1, 1, 1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 4;
    got = min_coins(100, [1, 5, 10, 25]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = -1;
    got = min_coins(7, [2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
