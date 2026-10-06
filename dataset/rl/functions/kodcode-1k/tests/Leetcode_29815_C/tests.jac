import from main { all_unique_in_sliding_window }

test "case 0" {
    want = True;
    got = all_unique_in_sliding_window([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = all_unique_in_sliding_window([1, 2, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = all_unique_in_sliding_window([1, 2, 3, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = all_unique_in_sliding_window([1, 2, 3, 1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = all_unique_in_sliding_window([1, 2, 3, 1], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = all_unique_in_sliding_window([-1, -2, -3, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = all_unique_in_sliding_window([-1, -1, -2, -3], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = all_unique_in_sliding_window([1, 2, 1, 3, 4], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = all_unique_in_sliding_window([1, 2, 3, 4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = all_unique_in_sliding_window([1, 2, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
