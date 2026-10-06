import from main { longestIncreasingSequence }

test "case 0" {
    want = [1];
    got = longestIncreasingSequence([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2];
    got = longestIncreasingSequence([2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = longestIncreasingSequence([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4];
    got = longestIncreasingSequence([1, 2, 1, 2, 3, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5];
    got = longestIncreasingSequence([5, 1, 2, 3, 4, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 4, 5];
    got = longestIncreasingSequence([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [5];
    got = longestIncreasingSequence([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [3, 4, 5];
    got = longestIncreasingSequence([3, 3, 4, 5, 1, 2, 3, 0, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1, 2, 3, 4, 5];
    got = longestIncreasingSequence([3, 2, 1, 1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
