import from main { trap_rain_water }

test "case 0" {
    want = 6;
    got = trap_rain_water([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = trap_rain_water([1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = trap_rain_water([2, 1, 0, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = trap_rain_water([2, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 7;
    got = trap_rain_water([4, 2, 3, 1, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 9;
    got = trap_rain_water([4, 2, 0, 3, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = trap_rain_water([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = trap_rain_water([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = trap_rain_water([0, 0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 2000000;
    got = trap_rain_water([0, 1000000, 0, 1000000, 0, 1000000, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
