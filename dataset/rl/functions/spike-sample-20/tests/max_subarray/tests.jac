import from main { max_subarray }

test "all negative" {
    want = -3;
    got = max_subarray([-8, -3, -6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "single" {
    want = 5;
    got = max_subarray([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "whole array" {
    want = 6;
    got = max_subarray([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "middle run" {
    want = 8;
    got = max_subarray([2, -10, 3, 4, -1, 2, -20, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "zeros" {
    want = 0;
    got = max_subarray([0, -1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
