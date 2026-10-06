import from main { compressed_longest_increasing_subsequence }

test "case 0" {
    want = 4;
    got = compressed_longest_increasing_subsequence([10, 9, 2, 5, 3, 7, 101, 18]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = compressed_longest_increasing_subsequence([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = compressed_longest_increasing_subsequence([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = compressed_longest_increasing_subsequence([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = compressed_longest_increasing_subsequence([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = compressed_longest_increasing_subsequence([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = compressed_longest_increasing_subsequence([3, 10, 2, 1, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 4;
    got = compressed_longest_increasing_subsequence([3, 4, 2, 8, 10, 5, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = compressed_longest_increasing_subsequence([1000000000, 999999999, 1000000001]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
