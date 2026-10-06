import from main { maxProfit }

test "case 0" {
    want = 0;
    got = maxProfit(2, [3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = maxProfit(2, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = maxProfit(1, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 7;
    got = maxProfit(2, [3, 2, 6, 5, 0, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = maxProfit(100, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 7;
    got = maxProfit(100, [3, 2, 6, 5, 0, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = maxProfit(2, [5, 2, 4, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 7;
    got = maxProfit(3, [7, 1, 5, 3, 6, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 13;
    got = maxProfit(2, [1, 2, 4, 2, 5, 7, 2, 4, 9, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
