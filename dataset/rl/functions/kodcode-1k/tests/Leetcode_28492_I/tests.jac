import from main { max_unique_integers }

test "case 0" {
    want = 3;
    got = max_unique_integers([1, 2, 3, 1, 2, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = max_unique_integers([1, 1, 1, 1, 1, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = max_unique_integers([1, 2, 1, 3, 4], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = max_unique_integers([4, 2, 1, 3, 4, 1, 2, 3], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = max_unique_integers([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = max_unique_integers([1, 2, 3], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = max_unique_integers([1, 2, 3, 4, 5, 6], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
