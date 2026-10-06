import from main { binary_search_rotated }

test "case 0" {
    want = 4;
    got = binary_search_rotated([4, 5, 6, 7, 0, 1, 2], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = binary_search_rotated([6, 7, 0, 1, 2, 4, 5], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = binary_search_rotated([7, 0, 1, 2, 4, 5, 6], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = binary_search_rotated([4, 5, 6, 7, 0, 1, 2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = binary_search_rotated([6, 7, 0, 1, 2, 4, 5], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = binary_search_rotated([7, 0, 1, 2, 4, 5, 6], -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = binary_search_rotated([], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = binary_search_rotated([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = -1;
    got = binary_search_rotated([1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 3;
    got = binary_search_rotated([1, 2, 3, 4, 5, 6, 7], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = -1;
    got = binary_search_rotated([1, 2, 3, 4, 5, 6, 7], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}
