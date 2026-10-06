import from main { determine_round_winner }

test "case 0" {
    want = 'A';
    got = determine_round_winner(5, 'AABBA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'A';
    got = determine_round_winner(3, 'AAA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'B';
    got = determine_round_winner(5, 'ABBBB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'B';
    got = determine_round_winner(3, 'BBB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'T';
    got = determine_round_winner(6, 'ABBBAA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'T';
    got = determine_round_winner(2, 'AB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'T';
    got = determine_round_winner(4, 'AABB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'A';
    got = determine_round_winner(1, 'A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'B';
    got = determine_round_winner(1, 'B');
    assert got == want, f"expected={want!r} actual={got!r}";
}
