import from main { can_reach_target_sum }

test "case 0" {
    want = 'YES';
    got = can_reach_target_sum([1, 2, 3, 4, 5], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = can_reach_target_sum([1, 2, 3], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = can_reach_target_sum([5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = can_reach_target_sum([5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = can_reach_target_sum([4, 4, 4, 4], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = can_reach_target_sum([4, 4, 4, 4], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
