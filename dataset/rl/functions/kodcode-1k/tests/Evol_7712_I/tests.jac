import from main { longest_even_subsequence }

test "case 0" {
    want = 3;
    got = longest_even_subsequence([1, 2, 4, 6, 3, 8, 10, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = longest_even_subsequence([1, 3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = longest_even_subsequence([2, 4, 6, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = longest_even_subsequence([1, 2, 4, 7, 8, 10, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = longest_even_subsequence([2, 4, 6, 1, 8, 10, 1, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = longest_even_subsequence([1, 3, 5, 7, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = longest_even_subsequence([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = longest_even_subsequence([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 10;
    got = longest_even_subsequence([2, 4, 6, 8, 10, 12, 14, 16, 18, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = longest_even_subsequence([1, 3, 5, 7, 9, 11, 13, 15, 17, 19]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 0;
    got = longest_even_subsequence([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 3;
    got = longest_even_subsequence([2, 4, 6, 1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 3;
    got = longest_even_subsequence([1, 3, 5, 2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
