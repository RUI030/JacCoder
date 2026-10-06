import from main { schedule_meetings }

test "case 0" {
    want = [(1, 3)];
    got = schedule_meetings([(1, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(1, 3), (3, 5), (5, 7)];
    got = schedule_meetings([(1, 3), (3, 5), (5, 7)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(1, 3), (3, 5)];
    got = schedule_meetings([(1, 3), (2, 4), (3, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [(1, 2), (2, 3), (3, 4)];
    got = schedule_meetings([(1, 2), (2, 3), (3, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(2, 4), (4, 7), (8, 10)];
    got = schedule_meetings([(0, 6), (1, 9), (2, 4), (3, 5), (4, 7), (5, 9), (8, 10)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [(1, 3), (3, 5), (5, 7), (8, 9)];
    got = schedule_meetings([(5, 7), (1, 3), (8, 9), (0, 6), (2, 4), (3, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [(2, 3), (3, 4)];
    got = schedule_meetings([(1, 4), (2, 3), (3, 5), (3, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
