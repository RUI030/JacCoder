import from main { sort_cards_descending }

test "case 0" {
    want = [10, 8, 6, 4, 3];
    got = sort_cards_descending(5, [3, 10, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [10, 8, 6, 4, 3];
    got = sort_cards_descending(5, [10, 8, 6, 4, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [10, 8, 6, 4, 3];
    got = sort_cards_descending(5, [3, 4, 6, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [5, 5, 5, 5, 5];
    got = sort_cards_descending(5, [5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [7];
    got = sort_cards_descending(1, [7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 1];
    got = sort_cards_descending(2, [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [2, 1];
    got = sort_cards_descending(2, [2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [7, 5, 3];
    got = sort_cards_descending(3, [7, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
    got = sort_cards_descending(10, [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [100000, 99999, 99998, 99997, 99996];
    got = sort_cards_descending(5, [100000, 99999, 99998, 99997, 99996]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
