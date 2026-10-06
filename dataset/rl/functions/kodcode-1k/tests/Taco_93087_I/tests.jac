import from main { findMissingPositive }

test "case 0" {
    want = 5;
    got = findMissingPositive([1, 3, 6, 4, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = findMissingPositive([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = findMissingPositive([-1, -2, -3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = findMissingPositive([0, 10, 2, -10, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = findMissingPositive([7, 8, 9, 11, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = findMissingPositive([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = findMissingPositive([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = findMissingPositive([2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = findMissingPositive([1, 2, 0, -1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
