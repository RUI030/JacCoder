import from main { can_construct_pattern }

test "case 0" {
    want = ['YES', 'NO', 'NO'];
    got = can_construct_pattern(3, [(6, [1, 1, 2, 2, 3, 3]), (4, [1, 2, 1, 2]), (5, [2, 2, 3, 3, 2])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['YES', 'YES'];
    got = can_construct_pattern(2, [(3, [1, 2, 3]), (4, [4, 4, 4, 4])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['YES'];
    got = can_construct_pattern(1, [(5, [1, 1, 2, 3, 3])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['NO'];
    got = can_construct_pattern(1, [(7, [1, 1, 1, 2, 2, 1, 1])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['YES'];
    got = can_construct_pattern(1, [(5, [1, 2, 3, 4, 5])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['YES'];
    got = can_construct_pattern(1, [(10, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ['YES'];
    got = can_construct_pattern(1, [(3, [1, 1, 1])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = ['NO'];
    got = can_construct_pattern(1, [(4, [1, 2, 2, 1])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = ['NO'];
    got = can_construct_pattern(1, [(6, [1, 2, 2, 3, 3, 2])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
