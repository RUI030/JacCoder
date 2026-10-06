import from main { trap_water }

test "case 0" {
    want = 0;
    got = trap_water([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = trap_water([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = trap_water([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = trap_water([0, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 6;
    got = trap_water([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = trap_water([3, 0, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = trap_water([2, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 9;
    got = trap_water([4, 2, 0, 3, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 8;
    got = trap_water([3, 1, 2, 1, 2, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 2;
    got = trap_water([2, 0, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
