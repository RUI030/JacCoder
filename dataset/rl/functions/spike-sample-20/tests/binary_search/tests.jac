import from main { binary_search }

test "empty" {
    want = -1;
    got = binary_search([], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "first of duplicates" {
    want = 1;
    got = binary_search([2, 4, 4, 4, 9], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "first element" {
    want = 0;
    got = binary_search([-5, 0, 5], -5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "last element" {
    want = 2;
    got = binary_search([-5, 0, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "above range" {
    want = -1;
    got = binary_search([1, 2, 3], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "long list" {
    want = 617;
    got = binary_search([i * 2 for i in range(1000)], 1234);
    assert got == want, f"expected={want!r} actual={got!r}";
}
