import from main { max_balanced_teams }

test "case 0" {
    want = 2;
    got = max_balanced_teams(8, 5, [10, 12, 15, 22, 20, 12, 20, 25]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = max_balanced_teams(6, 2, [1, 3, 5, 7, 9, 11]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = max_balanced_teams(7, 100, [10, 20, 30, 40, 50, 60, 70]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = max_balanced_teams(0, 0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = max_balanced_teams(4, 10, [1, 2, 3, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = max_balanced_teams(10, 4, [6, 5, 6, 3, 8, 9, 2, 5, 1, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
