import from main { determine_treasure_locations }

test "case 0" {
    want = ['Treasure', 'Empty'];
    got = determine_treasure_locations([(0, 0), (1, 1), (2, 2)], [(0, 0), (1, 0)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['Treasure', 'Empty', 'Treasure'];
    got = determine_treasure_locations([(-1, -1), (2, 2)], [(2, 2), (3, 3), (-1, -1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['Treasure', 'Empty'];
    got = determine_treasure_locations([(1000000, 1000000)], [(1000000, 1000000), (999999, 999999)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['Empty', 'Empty'];
    got = determine_treasure_locations([], [(0, 0), (1, 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['Treasure', 'Empty', 'Treasure'];
    got = determine_treasure_locations([(1, 2), (2, 3), (3, 4)], [(3, 4), (4, 5), (1, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['Empty', 'Empty'];
    got = determine_treasure_locations([], [(0, 0), (-1000000, -1000000)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ['Treasure', 'Treasure', 'Treasure'];
    got = determine_treasure_locations([(1, 1), (2, 2), (3, 3)], [(1, 1), (2, 2), (3, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
