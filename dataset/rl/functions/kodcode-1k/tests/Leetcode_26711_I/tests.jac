import from main { four_sum }

test "case 0" {
    want = True;
    got = four_sum([1, 0, -1, 0, -2, 2], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = four_sum([1, 2, 3, 4, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = four_sum([1, 2, 3, 4, 5], 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = four_sum([-1, 0, 1, 2, -1, -4], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = four_sum([1, 2, 3, 4, 5, 6, 7, 8], 26);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = four_sum([1, 2, 3, 4, 5, 6, 7, 8], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = four_sum([-5, 3, 1, 0, -1, 2, -2, 4], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = four_sum([-5, -4, -3, -2, -1], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
