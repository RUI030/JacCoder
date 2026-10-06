import from main { can_rearrange }

test "case 0" {
    want = True;
    got = can_rearrange([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = can_rearrange([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = can_rearrange([0, 1, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = can_rearrange([1, 0, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = can_rearrange([1, 1, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = can_rearrange([1, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = can_rearrange([0, 0, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = can_rearrange([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = can_rearrange([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = can_rearrange([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
