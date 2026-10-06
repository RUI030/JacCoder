import from main { has_pair_with_sum }

test "case 0" {
    want = True;
    got = has_pair_with_sum([3, 5, 1, 7, 4, 2], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = has_pair_with_sum([1, 2, 3, 9, 4, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = has_pair_with_sum([10, 15, 3, 7], 17);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = has_pair_with_sum([1, 2, 3, 4], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = has_pair_with_sum([1, 5, 3], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = has_pair_with_sum([7, 7, 7, 7], 13);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = has_pair_with_sum([], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = has_pair_with_sum([5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = has_pair_with_sum([1, 2, 3, 2, 4], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
