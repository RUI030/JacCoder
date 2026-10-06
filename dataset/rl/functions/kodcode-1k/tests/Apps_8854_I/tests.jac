import from main { longest_increasing_subsequence }

test "case 0" {
    want = 4;
    got = longest_increasing_subsequence([10, 20, 10, 30, 20, 50]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = longest_increasing_subsequence([3, 10, 2, 1, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_increasing_subsequence([3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = longest_increasing_subsequence([50, 3, 10, 7, 40, 80]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 9;
    got = longest_increasing_subsequence([1, 2, 3, 4, 5, 6, 7, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = longest_increasing_subsequence([9, 8, 7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = longest_increasing_subsequence([5, 1, 6, 2, 7, 3, 8, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = longest_increasing_subsequence([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
