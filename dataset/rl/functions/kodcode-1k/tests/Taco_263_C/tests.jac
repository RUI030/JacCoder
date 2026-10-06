import from main { longest_same_parity_subarray }

test "case 0" {
    want = 3;
    got = longest_same_parity_subarray([1, 2, 4, 6, 5, 7, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_same_parity_subarray([1, 3, 5, 2, 4, 6, 8, 7, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_same_parity_subarray([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = longest_same_parity_subarray([2, 4, 8, 6, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 5;
    got = longest_same_parity_subarray([1, 3, 5, 7, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = longest_same_parity_subarray([1, 2, 2, 3, 3, 3, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = longest_same_parity_subarray([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = longest_same_parity_subarray([1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = longest_same_parity_subarray([2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 1;
    got = longest_same_parity_subarray([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
