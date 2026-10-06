import from main { max_total_rarity }

test "case 0" {
    want = 90;
    got = max_total_rarity(5, 2, [10, 50, 20, 30, 40]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 16;
    got = max_total_rarity(3, 3, [5, 8, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = max_total_rarity(4, 1, [10, 10, 10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 100;
    got = max_total_rarity(1, 1, [100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 20;
    got = max_total_rarity(4, 2, [10, 10, 10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2499999999;
    got = max_total_rarity(5, 3, [1000000000, 999999999, 500000000, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_total_rarity(4, 2, [0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
