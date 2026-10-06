import from main { rotate_list }

test "case 0" {
    want = [5, 6, 7, 1, 2, 3, 4];
    got = rotate_list([1, 2, 3, 4, 5, 6, 7], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [3, 99, -1, -100];
    got = rotate_list([-1, -100, 3, 99], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [3, 1, 2];
    got = rotate_list([1, 2, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1];
    got = rotate_list([1], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2];
    got = rotate_list([1, 2], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = rotate_list([], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2, 3, 4, 5];
    got = rotate_list([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 2, 3, 4, 5];
    got = rotate_list([1, 2, 3, 4, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [4, 5, 1, 2, 3];
    got = rotate_list([1, 2, 3, 4, 5], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}
