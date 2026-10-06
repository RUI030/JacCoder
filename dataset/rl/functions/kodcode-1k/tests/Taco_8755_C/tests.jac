import from main { maxCoins }

test "case 0" {
    want = 12;
    got = maxCoins([[0, 3, 1, 1], [2, 0, 0, 4], [1, 5, 3, 1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = maxCoins([[5]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = maxCoins([[1, 2, 3, 4]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = maxCoins([[1], [2], [3], [4]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = maxCoins([[1, 2], [1, 1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 29;
    got = maxCoins([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
