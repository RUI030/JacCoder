import from main { longest_alternating_subsequence }

test "case 0" {
    want = 6;
    got = longest_alternating_subsequence([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = longest_alternating_subsequence([42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_alternating_subsequence([2, 4, 6, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = longest_alternating_subsequence([1, 3, 5, 7, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 9;
    got = longest_alternating_subsequence([1, 2, 3, 4, 5, 6, 7, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 9;
    got = longest_alternating_subsequence([2, 1, 4, 3, 6, 5, 8, 7, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = longest_alternating_subsequence([1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 19;
    got = longest_alternating_subsequence([2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = longest_alternating_subsequence([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
