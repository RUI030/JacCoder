import from main { min_energy_to_travel }

test "case 0" {
    want = 1;
    got = min_energy_to_travel(5, [4, 7, 2, 8, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_energy_to_travel(3, [3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = min_energy_to_travel(4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = min_energy_to_travel(4, [4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = min_energy_to_travel(6, [10, 15, 7, 11, 18, 13]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
