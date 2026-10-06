import from main { can_knight_move }

test "case 0" {
    want = 'YES';
    got = can_knight_move(0, 0, 1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = can_knight_move(0, 0, 2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'NO';
    got = can_knight_move(3, 3, 3, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = can_knight_move(0, 0, 2, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = can_knight_move(0, 0, 1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = can_knight_move(4, 4, 6, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'YES';
    got = can_knight_move(4, 4, 5, 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'NO';
    got = can_knight_move(0, 0, 0, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'NO';
    got = can_knight_move(0, 0, 3, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'NO';
    got = can_knight_move(-5, -5, 5, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
