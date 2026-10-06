import from main { can_arrange_books }

test "case 0" {
    want = 'YES';
    got = can_arrange_books(7, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = can_arrange_books(6, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = can_arrange_books(10, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = can_arrange_books(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = can_arrange_books(55, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = can_arrange_books(14, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
