import from main { binary_search }

test "case 0" {
    want = 2;
    got = binary_search([1, 2, 3, 4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = binary_search([10, 20, 30, 40, 50], 40);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = binary_search([-5, 0, 2, 3, 9], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = binary_search([1, 2, 3, 4, 5], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = binary_search([10, 20, 30, 40, 50], 25);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = binary_search([-5, 0, 2, 3, 9], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = binary_search([], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = binary_search([3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = -1;
    got = binary_search([3], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = binary_search([1, 2, 3, 4, 5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 4;
    got = binary_search([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 2;
    got = binary_search([1, 2, 3, 4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
