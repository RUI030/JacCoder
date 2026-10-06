import from main { rearrange_list }

test "case 0" {
    want = [2, 4, 6, 1, 3, 5];
    got = rearrange_list([4, 3, 1, 2, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [-2, 0, 2, 4, -3, -1, 1];
    got = rearrange_list([-2, -3, 4, 1, -1, 2, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2, 4, 6, 8];
    got = rearrange_list([8, 2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [3, 5, 7, 9];
    got = rearrange_list([3, 7, 5, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-2, 4, 10, -7, -1, 3];
    got = rearrange_list([10, -2, 3, -7, 4, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = rearrange_list([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [4];
    got = rearrange_list([4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [5];
    got = rearrange_list([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
