import from main { transform_list }

test "case 0" {
    want = [4, 16, 36];
    got = transform_list([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4, 16, 36, 64];
    got = transform_list([2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = transform_list([1, 3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [4, 0, 4];
    got = transform_list([-2, -3, 0, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = transform_list([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
