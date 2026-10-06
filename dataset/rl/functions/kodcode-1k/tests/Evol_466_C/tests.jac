import from main { has_pair_with_sum }

test "case 0" {
    want = True;
    got = has_pair_with_sum([2, 7, 11, 15], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = has_pair_with_sum([1, 2, 3, 4], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = has_pair_with_sum([-1, 2, 4, 6], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = has_pair_with_sum([1, 2, 3, 4], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = has_pair_with_sum([-1, -2, -3, -4], -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = has_pair_with_sum([1, 1, 1, 1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = has_pair_with_sum([], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = has_pair_with_sum([1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = has_pair_with_sum([1, 5, 7, -1, 5], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}
