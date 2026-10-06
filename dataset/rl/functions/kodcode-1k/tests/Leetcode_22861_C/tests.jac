import from main { check_indices_with_sum }

test "case 0" {
    want = True;
    got = check_indices_with_sum([1, 2, 3, 4], 5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = check_indices_with_sum([1, 2, 3, 4], 8, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = check_indices_with_sum([1, 2, 3, 4], 10, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = check_indices_with_sum([1, 1, 1, 1], 3, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = check_indices_with_sum([], 5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = check_indices_with_sum([5], 5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = check_indices_with_sum([1, -2, 3, 0], 1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = check_indices_with_sum([1, 2, 3, 4], 5, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = check_indices_with_sum([5, 5, 5, 5], 11, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = check_indices_with_sum([2, 4, 6, 8], 8, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = check_indices_with_sum([2, 4, 6, 8], 10, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
