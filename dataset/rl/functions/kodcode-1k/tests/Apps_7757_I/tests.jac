import from main { daily_temperatures }

test "case 0" {
    want = [1, 1, 4, 2, 1, 1, 0, 0];
    got = daily_temperatures(8, [73, 74, 75, 71, 69, 72, 76, 73]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0, 0, 0, 0, 0];
    got = daily_temperatures(5, [75, 75, 75, 75, 75]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 1, 1, 1, 0];
    got = daily_temperatures(5, [70, 71, 72, 73, 74]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 0, 0, 0, 0];
    got = daily_temperatures(5, [74, 73, 72, 71, 70]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0];
    got = daily_temperatures(1, [75]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 3, 2, 1, 0, 0];
    got = daily_temperatures(6, [73, 74, 74, 71, 76, 75]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
