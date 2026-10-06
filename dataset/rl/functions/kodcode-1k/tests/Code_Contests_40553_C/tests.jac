import from main { highest_energy_value }

test "case 0" {
    want = 5;
    got = highest_energy_value(5, [1, 4, 3, 2, 5], [(1, 2), (1, 3), (2, 4), (3, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 10;
    got = highest_energy_value(3, [8, 3, 10], [(1, 2), (1, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = highest_energy_value(4, [1, 1, 1, 1], [(1, 2), (2, 3), (3, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = highest_energy_value(5, [5, 4, 3, 2, 1], [(1, 2), (2, 3), (3, 4), (4, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1000000000;
    got = highest_energy_value(2, [999999999, 1000000000], [(1, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = highest_energy_value(2, [0, 0], [(1, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
