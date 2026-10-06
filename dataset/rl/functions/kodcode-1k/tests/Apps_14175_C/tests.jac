import from main { daily_temperatures }

test "case 0" {
    want = [1, 1, 4, 2, 1, 1, 0, 0];
    got = daily_temperatures([73, 74, 75, 71, 69, 72, 76, 73]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0];
    got = daily_temperatures([73]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 1, 1, 1, 0];
    got = daily_temperatures([70, 72, 75, 78, 80]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 0, 0, 0, 0];
    got = daily_temperatures([80, 78, 75, 72, 70]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 0, 0, 0, 0];
    got = daily_temperatures([70, 70, 70, 70, 70]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [3, 2, 1, 1, 0];
    got = daily_temperatures([73, 71, 70, 74, 76]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 0, 1, 0, 1, 0];
    got = daily_temperatures([70, 72, 70, 72, 70, 72]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [4, 3, 2, 1, 0];
    got = daily_temperatures([-10, -20, -30, -40, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
