import from main { subarray_sums }

test "case 0" {
    want = [5, 8, 6, 5];
    got = subarray_sums([2, 3, 5, 1, 4], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = subarray_sums([1, 2, 3, 4, 5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [15];
    got = subarray_sums([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [2, 2, 2, 2];
    got = subarray_sums([1, 1, 1, 1, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3000, 3000, 3000];
    got = subarray_sums([1000, 1000, 1000, 1000, 1000], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
