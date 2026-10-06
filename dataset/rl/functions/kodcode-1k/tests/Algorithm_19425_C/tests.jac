import from main { longest_consecutive_subsequence }

test "case 0" {
    want = 4;
    got = longest_consecutive_subsequence([100, 4, 200, 1, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 10;
    got = longest_consecutive_subsequence([0, -1, 2, -3, 1, -2, 3, 4, -4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_consecutive_subsequence([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = longest_consecutive_subsequence([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 5;
    got = longest_consecutive_subsequence([1, 2, 2, 3, 4, 4, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = longest_consecutive_subsequence([10, 100, 1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
