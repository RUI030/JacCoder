import from main { max_non_overlapping_events }

test "case 0" {
    want = 2;
    got = max_non_overlapping_events(5, [(1, 4), (2, 5), (3, 6), (4, 7), (5, 8)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = max_non_overlapping_events(3, [(1, 3), (2, 4), (3, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = max_non_overlapping_events(5, [(1, 2), (3, 4), (5, 6), (7, 8), (9, 10)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = max_non_overlapping_events(4, [(1, 10), (2, 9), (3, 8), (4, 7)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = max_non_overlapping_events(4, [(1, 2), (2, 3), (3, 5), (1, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = max_non_overlapping_events(1, [(1, 10)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = max_non_overlapping_events(6, [(1, 3), (2, 5), (4, 6), (7, 8), (5, 9), (10, 11)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
