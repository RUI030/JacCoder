import from main { longest_increasing_subsequence }

test "case 0" {
    want = 4;
    got = longest_increasing_subsequence([10, 9, 2, 5, 3, 7, 101, 18]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = longest_increasing_subsequence([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_increasing_subsequence([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 7;
    got = longest_increasing_subsequence([1, 2, 3, 4, 5, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = longest_increasing_subsequence([7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = longest_increasing_subsequence([3, 10, 2, 1, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = longest_increasing_subsequence([50, 3, 10, 7, 40, 80]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = longest_increasing_subsequence([3, 3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
