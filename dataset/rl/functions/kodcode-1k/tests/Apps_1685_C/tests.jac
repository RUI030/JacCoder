import from main { isMountainArray }

test "case 0" {
    want = True;
    got = isMountainArray([0, 2, 3, 4, 5, 2, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = isMountainArray([0, 2, 3, 3, 5, 2, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = isMountainArray([0, 1, 2, 3, 4, 5, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = isMountainArray([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = isMountainArray([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = isMountainArray([3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = isMountainArray([1, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = isMountainArray([1, 2, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = isMountainArray([0, 1, 2, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = isMountainArray([0, 2, 2, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = isMountainArray([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = False;
    got = isMountainArray([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
