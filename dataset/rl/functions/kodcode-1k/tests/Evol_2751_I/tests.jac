import from main { max_product_of_three }

test "case 0" {
    want = 60;
    got = max_product_of_three([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 720;
    got = max_product_of_three([10, 9, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -6;
    got = max_product_of_three([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -720;
    got = max_product_of_three([-10, -9, -8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 300;
    got = max_product_of_three([-10, -10, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 180;
    got = max_product_of_three([-5, -4, -3, 3, 5, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 300;
    got = max_product_of_three([-10, -10, 0, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 6;
    got = max_product_of_three([-1, 0, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1000000000000;
    got = max_product_of_three([1000, 100, 10, 10000, 100000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 999999000000;
    got = max_product_of_three([0, -1, 1, 999999, 1000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
