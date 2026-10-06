import from main { min_sensors }

test "case 0" {
    want = 4;
    got = min_sensors(4, 4, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = min_sensors(5, 5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = min_sensors(1, 1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 9;
    got = min_sensors(10, 10, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = min_sensors(5, 5, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 8;
    got = min_sensors(5, 10, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
