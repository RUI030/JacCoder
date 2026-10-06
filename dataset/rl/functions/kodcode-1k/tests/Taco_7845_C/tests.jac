import from main { resolve_seat_conflicts }

test "case 0" {
    want = [[1, 1, 0], [0, 1, 0], [0, 0, 1]];
    got = resolve_seat_conflicts(3, 3, 4, [(1, 1), (1, 1), (2, 2), (3, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [[1, 1, 1, 0, 0]];
    got = resolve_seat_conflicts(1, 5, 3, [(1, 1), (1, 1), (1, 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [[1], [1], [1], [0], [0]];
    got = resolve_seat_conflicts(5, 1, 3, [(1, 1), (1, 1), (1, 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [[1, 0], [0, 1]];
    got = resolve_seat_conflicts(2, 2, 2, [(1, 1), (2, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [[1, 1], [1, 1]];
    got = resolve_seat_conflicts(2, 2, 4, [(1, 1), (1, 1), (1, 1), (1, 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
