import from main { rearrange_array }

test "case 0" {
    want = [9, 5, 3, 10, 10, 12, 14];
    got = rearrange_array([9, 12, 5, 10, 14, 3, 10], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = rearrange_array([1, 2, 3, 4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2, 1, 3, 5, 4];
    got = rearrange_array([5, 4, 3, 2, 1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [3, 3, 3, 3, 3];
    got = rearrange_array([3, 3, 3, 3, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 3, 3, 4, 5];
    got = rearrange_array([1, 2, 3, 4, 3, 5, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 7, 8, 9];
    got = rearrange_array([7, 8, 9, 1, 2, 3], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
