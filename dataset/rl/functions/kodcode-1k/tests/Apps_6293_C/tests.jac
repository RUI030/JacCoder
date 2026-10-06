import from main { maxSum }

test "case 0" {
    want = 15;
    got = maxSum([1, 3, 5, 2, 8, 1, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 8;
    got = maxSum([4, 4, 4, 4, 4], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 11;
    got = maxSum([5, -2, 1, 3, 9, -4, 2], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = maxSum([2, 2, 2, 2, 2, 2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 8;
    got = maxSum([2, 7, 1, 8, 2, 8, 3], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 15;
    got = maxSum([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 8;
    got = maxSum([-1, 3, 4, -2, 6, -1, 2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -3;
    got = maxSum([-3, -2, -1, -4, -2], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = maxSum([0, 0, 0, 4, 0], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = maxSum([], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 0;
    got = maxSum([1, 2, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
