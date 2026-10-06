import from main { balance_bus_capacity }

test "case 0" {
    want = (0, [10, 20]);
    got = balance_bus_capacity(3, [(10, 5), (20, 15)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (10, [10, 20]);
    got = balance_bus_capacity(3, [(5, 10), (15, 20)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (5, [10, 10, 20]);
    got = balance_bus_capacity(4, [(10, 5), (5, 10), (20, 15)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (1, [100000, 100000]);
    got = balance_bus_capacity(2, [(100000, 100000), (99999, 100000)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (0, [10, 15, 20, 30]);
    got = balance_bus_capacity(5, [(10, 5), (15, 12), (20, 20), (30, 25)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
