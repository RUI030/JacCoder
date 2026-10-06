import from main { subarray_sum }

test "case 0" {
    want = 2;
    got = subarray_sum([1, 1, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = subarray_sum([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = subarray_sum([1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = subarray_sum([-1, -1, 1], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = subarray_sum([1, 2, 3, 0, 1, -1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = subarray_sum([1, 2, 1, 2, 1], 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = subarray_sum([-1, -1, -1, -1], -2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 10;
    got = subarray_sum([0, 0, 0, 0], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
