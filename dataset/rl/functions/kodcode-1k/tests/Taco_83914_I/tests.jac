import from main { minimum_dissatisfaction_score }

test "case 0" {
    want = 3;
    got = minimum_dissatisfaction_score(4, [2, 4, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 9;
    got = minimum_dissatisfaction_score(3, [10, 1, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = minimum_dissatisfaction_score(5, [7, 7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = minimum_dissatisfaction_score(1, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 9;
    got = minimum_dissatisfaction_score(2, [1, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = minimum_dissatisfaction_score(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = minimum_dissatisfaction_score(5, [5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 999999;
    got = minimum_dissatisfaction_score(3, [1000000, 500000, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
