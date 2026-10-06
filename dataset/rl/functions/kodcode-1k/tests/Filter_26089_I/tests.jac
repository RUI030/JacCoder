import from main { remove_zeros }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = remove_zeros([1, 2, 0, 3, 0, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = remove_zeros([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = remove_zeros([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = remove_zeros([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [7, 8, 9];
    got = remove_zeros([7, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
