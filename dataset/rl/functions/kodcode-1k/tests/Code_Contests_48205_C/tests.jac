import from main { max_people_working_simultaneously }

test "case 0" {
    want = 1;
    got = max_people_working_simultaneously(1, [(1, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = max_people_working_simultaneously(2, [(1, 3), (4, 6)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = max_people_working_simultaneously(3, [(1, 4), (1, 4), (1, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = max_people_working_simultaneously(5, [(1, 4), (2, 6), (4, 7), (5, 9), (7, 10)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = max_people_working_simultaneously(3, [(0, 2), (1, 3), (2, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = max_people_working_simultaneously(3, [(0, 3), (1, 10), (2, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = max_people_working_simultaneously(4, [(0, 1), (1, 2), (2, 3), (3, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
