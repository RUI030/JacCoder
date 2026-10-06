import from main { max_employees_logged_in }

test "case 0" {
    want = 1;
    got = max_employees_logged_in(1, [(1, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = max_employees_logged_in(5, [(1, 4), (2, 6), (4, 7), (5, 8), (6, 9)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = max_employees_logged_in(4, [(3, 5), (1, 2), (4, 6), (5, 7)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = max_employees_logged_in(3, [(0, 43200), (43200, 86400), (0, 86400)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = max_employees_logged_in(3, [(1, 2), (3, 4), (5, 6)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = max_employees_logged_in(2, [(0, 86400), (0, 86400)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
