import from main { maxProfit }

test "case 0" {
    want = 7;
    got = maxProfit([7, 1, 5, 3, 6, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = maxProfit([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = maxProfit([7, 6, 4, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = maxProfit([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = maxProfit([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = maxProfit([3, 3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
