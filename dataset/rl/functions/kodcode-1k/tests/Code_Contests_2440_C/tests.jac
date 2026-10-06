import from main { max_activities }

test "case 0" {
    want = 2;
    got = max_activities(3, [(1, 4), (2, 3), (3, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = max_activities(4, [(1, 2), (3, 4), (0, 6), (5, 7)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = max_activities(0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = max_activities(1, [(1, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = max_activities(3, [(1, 3), (2, 3), (3, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = max_activities(3, [(1, 5), (2, 6), (3, 7)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = max_activities(3, [(1, 2), (2, 3), (3, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
