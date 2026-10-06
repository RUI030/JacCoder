import from main { custom_slice }

test "case 0" {
    want = [3, 5, 7];
    got = custom_slice([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 2, 8, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [10, 20, 30];
    got = custom_slice([10, 20, 30, 40, 50], None, 3, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [20, 30, 40, 50];
    got = custom_slice([10, 20, 30, 40, 50], 1, None, None);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [9, 7, 5];
    got = custom_slice([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 8, 2, -2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5];
    got = custom_slice([1, 2, 3, 4, 5], None, None, None);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 4, 5];
    got = custom_slice([1, 2, 3, 4, 5], -10, 10, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = custom_slice([], 0, 5, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
