import from main { can_attend_meetings }

test "case 0" {
    want = True;
    got = can_attend_meetings([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = can_attend_meetings([[1, 2], [3, 4], [5, 6]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = can_attend_meetings([[1, 4], [2, 5], [7, 8]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = can_attend_meetings([[1, 3], [3, 5], [4, 5]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = can_attend_meetings([[1, 2], [2, 3], [3, 4]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = can_attend_meetings([[5, 10], [9, 15]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = can_attend_meetings([[10, 20], [0, 15], [25, 30]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = can_attend_meetings([[5, 10]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
