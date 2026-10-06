import from main { merge_bookings }

test "case 0" {
    want = [(1, 6), (8, 10), (15, 18)];
    got = merge_bookings([(1, 3), (2, 6), (8, 10), (15, 18)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(1, 5)];
    got = merge_bookings([(1, 4), (4, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(1, 2), (3, 4), (5, 6)];
    got = merge_bookings([(1, 2), (3, 4), (5, 6)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [(1, 8)];
    got = merge_bookings([(1, 5), (2, 6), (3, 7), (4, 8)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(1, 4)];
    got = merge_bookings([(1, 2), (2, 3), (3, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = merge_bookings([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [(1, 5)];
    got = merge_bookings([(1, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
