import from main { max_contiguous_subsequence_sum }

test "case 0" {
    want = 0;
    got = max_contiguous_subsequence_sum([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = max_contiguous_subsequence_sum([-1, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 14;
    got = max_contiguous_subsequence_sum([-2, 3, 8, -1, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 12;
    got = max_contiguous_subsequence_sum([-2, 3, 8, -12, 8, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = max_contiguous_subsequence_sum([-1, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = max_contiguous_subsequence_sum([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = max_contiguous_subsequence_sum([-1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 10;
    got = max_contiguous_subsequence_sum([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 10;
    got = max_contiguous_subsequence_sum([4, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 3;
    got = max_contiguous_subsequence_sum([-1, 2, -1, 2, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
