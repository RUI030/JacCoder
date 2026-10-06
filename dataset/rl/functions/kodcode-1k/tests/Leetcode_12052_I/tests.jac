import from main { longest_winning_streak }

test "case 0" {
    want = 5;
    got = longest_winning_streak([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = longest_winning_streak([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = longest_winning_streak([1, 3, 2, 4, 3, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = longest_winning_streak([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = longest_winning_streak([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = longest_winning_streak([2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = longest_winning_streak([10, 20, 30, 15, 25, 35]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
