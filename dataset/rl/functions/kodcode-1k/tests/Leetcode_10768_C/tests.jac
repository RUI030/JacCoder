import from main { can_make_arithmetic_progression }

test "case 0" {
    want = True;
    got = can_make_arithmetic_progression([3, 5, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = can_make_arithmetic_progression([10, 20, 30, 40]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = can_make_arithmetic_progression([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = can_make_arithmetic_progression([1, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = can_make_arithmetic_progression([1, 3, 6, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = can_make_arithmetic_progression([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = can_make_arithmetic_progression([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = can_make_arithmetic_progression([-1, -4, -7, -10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = can_make_arithmetic_progression([-3, -1, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = can_make_arithmetic_progression([7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
