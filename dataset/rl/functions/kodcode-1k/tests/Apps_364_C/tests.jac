import from main { check_plan }

test "case 0" {
    want = True;
    got = check_plan('Basic', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = check_plan('Basic', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = check_plan('Standard', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = check_plan('Standard', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = check_plan('Standard', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = check_plan('Premium', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = check_plan('Premium', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = check_plan('Premium', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = check_plan('Premium', 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = check_plan('Premium', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = check_plan('Ultra', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = False;
    got = check_plan('', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = True;
    got = check_plan('Standard', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
