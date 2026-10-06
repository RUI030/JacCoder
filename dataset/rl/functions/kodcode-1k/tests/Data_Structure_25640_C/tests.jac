import from main { is_consecutive }

test "case 0" {
    want = True;
    got = is_consecutive([3, 4, 5, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_consecutive([3, 4, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_consecutive([3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_consecutive([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_consecutive([6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_consecutive([7, 8, 9, 10, 11]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_consecutive([5, 6, 7, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_consecutive([-2, -1, 0, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_consecutive([0, 1, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = is_consecutive([3, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
