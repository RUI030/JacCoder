import from main { longest_increasing_subsequence }

test "case 0" {
    want = 0;
    got = longest_increasing_subsequence([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = longest_increasing_subsequence([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_increasing_subsequence([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = longest_increasing_subsequence([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = longest_increasing_subsequence([6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = longest_increasing_subsequence([10, 9, 2, 5, 3, 7, 101, 18]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = longest_increasing_subsequence([1, 3, 2, 4, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 5;
    got = longest_increasing_subsequence([1, 5, 2, 6, 3, 7, 4, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
