import from main { is_schedule_valid }

test "case 0" {
    want = True;
    got = is_schedule_valid([(9, 12), (13, 15), (16, 18)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_schedule_valid([(9, 12), (11, 14), (16, 18)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_schedule_valid([(8, 10), (10, 12), (12, 14)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_schedule_valid([(10, 11), (11, 12), (12, 13), (13, 14)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_schedule_valid([(10, 11)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_schedule_valid([(9, 12), (10, 11)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_schedule_valid([(9, 12), (12, 15)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_schedule_valid([(9, 12), (11, 12)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
