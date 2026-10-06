import from main { subarray_sum }

test "case 0" {
    want = True;
    got = subarray_sum([1, 2, 3, 7, 5], 12);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = subarray_sum([1, 2, 3, 4, 5], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = subarray_sum([10, 2, -2, -20, 10], -10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = subarray_sum([1, 2, 3, 4, 5], 20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = subarray_sum([1, 2, 3], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = subarray_sum([10, 2, 3], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = subarray_sum([5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = subarray_sum([5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = subarray_sum([], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = subarray_sum([1, 2, -1, 3, -2, 4], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = subarray_sum([-1, -2, -3, -4, -5], -10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = False;
    got = subarray_sum([-1, -2, -3, -4, -5], -11);
    assert got == want, f"expected={want!r} actual={got!r}";
}
