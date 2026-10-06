import from main { min_cuts_to_non_decreasing }

test "case 0" {
    want = 2;
    got = min_cuts_to_non_decreasing([3, 7, 6, 2, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_cuts_to_non_decreasing([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = min_cuts_to_non_decreasing([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = min_cuts_to_non_decreasing([1, 5, 3, 6, 2, 8, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = min_cuts_to_non_decreasing([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = min_cuts_to_non_decreasing([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = min_cuts_to_non_decreasing([2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
