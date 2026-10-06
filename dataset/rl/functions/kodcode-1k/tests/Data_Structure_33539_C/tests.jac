import from main { optimized_interpolation_search }

test "case 0" {
    want = -1;
    got = optimized_interpolation_search([], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = optimized_interpolation_search([7], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -1;
    got = optimized_interpolation_search([7], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = optimized_interpolation_search([-25, -12, -1, 10, 12, 15, 20, 41, 55], -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = optimized_interpolation_search([5, 10, 12, 14, 17, 20, 21], 55);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = optimized_interpolation_search([5, 10, 12, 14, 17, 20, 21], -5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = optimized_interpolation_search([1, 2, 3, 4, 5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 4;
    got = optimized_interpolation_search([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = optimized_interpolation_search([1, 2, 3, 4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = optimized_interpolation_search([7, 7, 7, 7], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = -1;
    got = optimized_interpolation_search([10, 20, 30, 40, 50], 60);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = -1;
    got = optimized_interpolation_search([10, 20, 30, 40, 50], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
