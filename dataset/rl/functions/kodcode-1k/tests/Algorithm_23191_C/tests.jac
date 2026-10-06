import from main { is_subset_sum }

test "case 0" {
    want = True;
    got = is_subset_sum([3, 34, 4, 12, 5, 2], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_subset_sum([1, 2, 3, 7], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_subset_sum([3, 34, 4, 12, 5, 2], 30);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_subset_sum([1, 2, 3], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_subset_sum([1, 2, 3], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_subset_sum([1, 2, 3, -1], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_subset_sum([1, 2, 7, 11], 13);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_subset_sum([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_subset_sum([1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_subset_sum([], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = is_subset_sum([], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
