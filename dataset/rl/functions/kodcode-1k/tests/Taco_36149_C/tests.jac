import from main { max_teams }

test "case 0" {
    want = 2;
    got = max_teams(6, 3, [1, 2, 3, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = max_teams(7, 2, [1, 2, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = max_teams(5, 3, [1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = max_teams(0, 3, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = max_teams(1, 1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = max_teams(10, 5, [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = max_teams(5, 3, [1, 2, 2, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = max_teams(9, 3, [1, 2, 3, 4, 1, 2, 3, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
