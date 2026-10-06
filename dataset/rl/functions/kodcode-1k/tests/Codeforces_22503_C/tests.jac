import from main { longest_contiguous_subsequence_same_parity }

test "case 0" {
    want = 1;
    got = longest_contiguous_subsequence_same_parity(1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_contiguous_subsequence_same_parity(4, [2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = longest_contiguous_subsequence_same_parity(4, [1, 3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = longest_contiguous_subsequence_same_parity(6, [1, 2, 2, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = longest_contiguous_subsequence_same_parity(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = longest_contiguous_subsequence_same_parity(10, [1, 3, 5, 7, 9, 2, 4, 6, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = longest_contiguous_subsequence_same_parity(0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = longest_contiguous_subsequence_same_parity(10, [1, 2, 1, 2, 1, 2, 1, 2, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
