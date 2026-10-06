import from main { modify_set }

test "case 0" {
    want = {2, 3, 4};
    got = modify_set([1, 2, 3], [3, 4], [1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {1, 2, 3, 4};
    got = modify_set([1, 2], [3, 4], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {1, 4};
    got = modify_set([1, 2, 3, 4], [], [2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {1, 2, 3};
    got = modify_set([1, 2, 3], [], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {1, 2};
    got = modify_set([1, 2], [], [3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {1, 2, 3, 4};
    got = modify_set([1, 2, 3], [4, 5], [5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
