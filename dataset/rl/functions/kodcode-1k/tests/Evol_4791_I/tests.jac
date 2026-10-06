import from main { is_valid_schedule }

test "case 0" {
    want = True;
    got = is_valid_schedule([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_valid_schedule([(1, 2), (3, 5), (6, 8)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_valid_schedule([(1, 3), (2, 5), (4, 6)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_valid_schedule([(1, 2), (2, 3), (3, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_valid_schedule([(1, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_valid_schedule([(3, 5), (1, 2), (6, 8)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_valid_schedule([(4, 6), (1, 3), (2, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
