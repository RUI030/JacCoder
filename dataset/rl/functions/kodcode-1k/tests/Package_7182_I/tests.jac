import from main { find_longest_consecutive_subsequence }

test "case 0" {
    want = 4;
    got = find_longest_consecutive_subsequence([100, 4, 200, 1, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = find_longest_consecutive_subsequence([9, 1, -3, -2, 0, -1, 11, 12, 13, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = find_longest_consecutive_subsequence([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = find_longest_consecutive_subsequence([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = find_longest_consecutive_subsequence([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = find_longest_consecutive_subsequence([10, 20, 30, 40]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = find_longest_consecutive_subsequence([-5, -1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 7;
    got = find_longest_consecutive_subsequence([-1, 1, 0, -2, 2, -3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 5;
    got = find_longest_consecutive_subsequence([1, 2, 2, 1, 3, 4, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
