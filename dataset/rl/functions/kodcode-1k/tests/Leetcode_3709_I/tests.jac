import from main { is_robot_in_loop }

test "case 0" {
    want = True;
    got = is_robot_in_loop('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_robot_in_loop('LURD');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_robot_in_loop('LU');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_robot_in_loop('LLRR');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_robot_in_loop('RRUULL');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_robot_in_loop('LURDLURDLURD');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_robot_in_loop('LLLLUUUUURRRRLD');
    assert got == want, f"expected={want!r} actual={got!r}";
}
