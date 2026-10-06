import from main { can_rent_books }

test "case 0" {
    want = 'YES';
    got = can_rent_books([7, 5, 10], [6, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = can_rent_books([7, 5, 10], [8, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = can_rent_books([10, 10, 10], [10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = can_rent_books([5, 5, 5], [5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = can_rent_books([5], [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = can_rent_books([5], [6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
