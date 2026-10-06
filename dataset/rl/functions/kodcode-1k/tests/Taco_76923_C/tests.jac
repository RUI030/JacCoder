import from main { can_rearrange_no_adjacent_same_parity }

test "case 0" {
    want = ['YES', 'NO', 'NO'];
    got = can_rearrange_no_adjacent_same_parity(3, [(3, [1, 2, 3]), (4, [2, 4, 6, 8]), (5, [1, 3, 5, 7, 9])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['YES', 'NO'];
    got = can_rearrange_no_adjacent_same_parity(2, [(5, [1, 2, 3, 4, 5]), (3, [2, 4, 6])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['YES'];
    got = can_rearrange_no_adjacent_same_parity(1, [(6, [1, 3, 5, 2, 4, 6])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['YES'];
    got = can_rearrange_no_adjacent_same_parity(1, [(2, [1, 2])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['YES', 'YES'];
    got = can_rearrange_no_adjacent_same_parity(2, [(1, [1]), (1, [2])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
