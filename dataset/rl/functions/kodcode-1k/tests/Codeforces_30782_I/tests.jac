import from main { max_mountain_journey }

test "case 0" {
    want = 4;
    got = max_mountain_journey([(1, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 8;
    got = max_mountain_journey([(1, 5), (6, 10)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 9;
    got = max_mountain_journey([(1, 5), (2, 6), (4, 9), (7, 10)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 9;
    got = max_mountain_journey([(1, 10), (2, 8), (3, 7), (4, 6)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 9;
    got = max_mountain_journey([(4, 9), (1, 5), (7, 10), (2, 6)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 14;
    got = max_mountain_journey([(1, 5), (5, 10), (10, 15)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 19;
    got = max_mountain_journey([(1, 3), (2, 5), (4, 6), (5, 9), (8, 12), (10, 15), (14, 20)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
