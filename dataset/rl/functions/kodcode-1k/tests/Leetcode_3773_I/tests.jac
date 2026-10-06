import from main { max_length_subarray }

test "case 0" {
    want = 0;
    got = max_length_subarray([], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = max_length_subarray([5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = max_length_subarray([1, 10, 20, 30], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = max_length_subarray([3, 6, 7, 9], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = max_length_subarray([10, 1, 2, 4, 7, 2], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = max_length_subarray([8, 2, 4, 7], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = max_length_subarray([4, 2, -3, 7, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 5;
    got = max_length_subarray([4, 2, -3, 7, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = max_length_subarray([4, 2, -3, 7, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 4;
    got = max_length_subarray([1, 2, 3, 4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 2;
    got = max_length_subarray([1, 2, 3, 4, 5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 4;
    got = max_length_subarray([5, 4, 3, 2, 1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 2;
    got = max_length_subarray([5, 4, 3, 2, 1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
