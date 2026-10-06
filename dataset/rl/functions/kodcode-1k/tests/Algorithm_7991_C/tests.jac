import from main { subsequence_sum_exists }

test "case 0" {
    want = True;
    got = subsequence_sum_exists([], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = subsequence_sum_exists([], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = subsequence_sum_exists([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = subsequence_sum_exists([1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = subsequence_sum_exists([1, 2, 3], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = subsequence_sum_exists([1, 2, 3, 7], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = subsequence_sum_exists([1, 2, 3, 4], 11);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = subsequence_sum_exists([1, -2, 3, 4], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = subsequence_sum_exists([-1, -2, -3, -4], -6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = subsequence_sum_exists([1, 2, 3, -6], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = subsequence_sum_exists([1000, 2000, 3000, 4000], 10000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = subsequence_sum_exists([1000, 2000, 3000, 4000], 2000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = True;
    got = subsequence_sum_exists([1000, 2000, -3000, 4000], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = True;
    got = subsequence_sum_exists([5, -2, -1, 2, 0], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = True;
    got = subsequence_sum_exists([5, -2, -1, 2, 0], -2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = True;
    got = subsequence_sum_exists([1, -1, 1, -1, 1], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = False;
    got = subsequence_sum_exists([1, 2, 3, 4], 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
