import from main { find_duplicate }

test "case 0" {
    want = -1;
    got = find_duplicate([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = find_duplicate([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = find_duplicate([1, 2, 3, 4, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = find_duplicate([10, 22, 5, 10, 13, 22]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 7;
    got = find_duplicate([7, 7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = find_duplicate([5, 6, 7, 8, 6, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = find_duplicate([1, 2, 3, 4, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 4;
    got = find_duplicate([2, 4, 3, 6, 8, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
