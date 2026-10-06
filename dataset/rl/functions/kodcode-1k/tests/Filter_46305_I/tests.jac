import from main { check_increasing_decreasing }

test "case 0" {
    want = True;
    got = check_increasing_decreasing([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = check_increasing_decreasing([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = check_increasing_decreasing([1, 1, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = check_increasing_decreasing([1, 1, 5, 4, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = check_increasing_decreasing([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = check_increasing_decreasing([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = check_increasing_decreasing([1, 2, 3, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = check_increasing_decreasing([5, 3, 2, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = check_increasing_decreasing([2, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = check_increasing_decreasing([1, 2, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = check_increasing_decreasing([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
