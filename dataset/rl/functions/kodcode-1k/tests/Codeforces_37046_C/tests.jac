import from main { longest_contiguous_multiple_subsequence }

test "case 0" {
    want = 4;
    got = longest_contiguous_multiple_subsequence(7, [3, 6, 12, 36, 6, 18, 54]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = longest_contiguous_multiple_subsequence(5, [5, 10, 2, 20, 40]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_contiguous_multiple_subsequence(1, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = longest_contiguous_multiple_subsequence(6, [2, 3, 5, 7, 11, 13]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = longest_contiguous_multiple_subsequence(4, [2, 4, 8, 16]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = longest_contiguous_multiple_subsequence(6, [3, 6, 12, 7, 14, 28]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
