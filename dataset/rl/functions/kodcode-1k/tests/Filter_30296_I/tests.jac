import from main { sort_list }

test "case 0" {
    want = [2, 3, 5, 6, 9];
    got = sort_list([9, 5, 2, 6, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = sort_list([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 2, 3, 4];
    got = sort_list([4, 1, 2, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [-2, -1, 0, 2, 3];
    got = sort_list([3, -1, -2, 2, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = sort_list([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1];
    got = sort_list([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
