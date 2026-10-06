import from main { max_cards }

test "case 0" {
    want = 4;
    got = max_cards(6, [3, 1, 2, 5, 6, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = max_cards(1, [100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = max_cards(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = max_cards(5, [5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = max_cards(7, [1, 7, 3, 5, 2, 6, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = max_cards(5, [2, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = max_cards(8, [10, 20, 10, 30, 20, 50, 40, 60]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
