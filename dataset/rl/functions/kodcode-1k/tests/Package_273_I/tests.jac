import from main { count_unique_integers }

test "case 0" {
    want = 5;
    got = count_unique_integers([1, 2, 2, 3, 4, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = count_unique_integers([1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = count_unique_integers([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = count_unique_integers([1, 1, 2, 2, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = count_unique_integers([6, 6, 6, 6, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 10;
    got = count_unique_integers([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 9;
    got = count_unique_integers([2, 3, 5, 7, 11, 13, 17, 19, 23, 23, 23]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 4;
    got = count_unique_integers([-1, -2, -3, -4, -1, -2, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = count_unique_integers([1000000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 2;
    got = count_unique_integers([-1000000000, -1000000000, 1000000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
