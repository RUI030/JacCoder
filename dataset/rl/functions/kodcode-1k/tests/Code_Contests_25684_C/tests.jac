import from main { longest_interesting_subarray }

test "case 0" {
    want = 6;
    got = longest_interesting_subarray([2, 4, 6, 8, 10, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_interesting_subarray([1, 3, 5, 8, 10, 12, 14]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_interesting_subarray([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = longest_interesting_subarray([5, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = longest_interesting_subarray([3, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = longest_interesting_subarray([4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = longest_interesting_subarray([1, 2, 4, 7, 11]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 4;
    got = longest_interesting_subarray([1, 4, 7, 10, 8, 6, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 3;
    got = longest_interesting_subarray([5, 5, 10, 20, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 2;
    got = longest_interesting_subarray([1, 3, 6, 10, 15, 21, 28]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
