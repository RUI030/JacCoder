import from main { longest_multiple_subsequence }

test "case 0" {
    want = 5;
    got = longest_multiple_subsequence([1, 2, 4, 8, 16, 3, 9, 27]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_multiple_subsequence([3, 6, 4, 12, 24]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = longest_multiple_subsequence([4, 8, 5, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = longest_multiple_subsequence([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = longest_multiple_subsequence([2, 5, 7, 11]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 8;
    got = longest_multiple_subsequence([1, 2, 4, 8, 16, 32, 64, 128]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = longest_multiple_subsequence([1000000000, 500000000, 250000000, 125000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = longest_multiple_subsequence([5, 11, 17, 23]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 5;
    got = longest_multiple_subsequence([1, 3, 9, 27, 6, 18, 54]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
