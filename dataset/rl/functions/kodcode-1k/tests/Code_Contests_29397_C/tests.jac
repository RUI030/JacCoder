import from main { can_ball_pass }

test "case 0" {
    want = 'No';
    got = can_ball_pass(5, [2, 3, 1, 5, 4], 3, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'No';
    got = can_ball_pass(4, [1, 3, 5, 6], 2, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'No';
    got = can_ball_pass(3, [1, 5, 1], 4, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Yes';
    got = can_ball_pass(4, [1, 2, 3, 4], 2, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Yes';
    got = can_ball_pass(5, [5, 4, 5, 4, 5], 5, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Yes';
    got = can_ball_pass(3, [1, 2, 1], 1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Yes';
    got = can_ball_pass(1, [1], 1, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Yes';
    got = can_ball_pass(2, [1, 1], 1, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'Yes';
    got = can_ball_pass(2, [1, 10], 10, 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'No';
    got = can_ball_pass(2, [1, 10], 10, 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}
