import from main { can_plant_seedlings }

test "case 0" {
    want = ['YES'];
    got = can_plant_seedlings(1, [(5, 0)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['YES'];
    got = can_plant_seedlings(1, [(100, 0)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['YES'];
    got = can_plant_seedlings(1, [(5, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['YES'];
    got = can_plant_seedlings(1, [(7, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['YES'];
    got = can_plant_seedlings(1, [(7, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['NO'];
    got = can_plant_seedlings(1, [(4, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ['NO'];
    got = can_plant_seedlings(1, [(4, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = ['NO'];
    got = can_plant_seedlings(1, [(10, 6)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = ['YES', 'YES', 'NO'];
    got = can_plant_seedlings(3, [(5, 2), (7, 4), (4, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = ['YES', 'YES', 'NO', 'YES'];
    got = can_plant_seedlings(4, [(5, 1), (6, 3), (6, 4), (8, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
