import from main { maximum_product_of_three }

test "case 0" {
    want = 0;
    got = maximum_product_of_three([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = maximum_product_of_three([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 6;
    got = maximum_product_of_three([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 500;
    got = maximum_product_of_three([-10, -10, 5, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 300;
    got = maximum_product_of_three([-10, -10, 1, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 300;
    got = maximum_product_of_three([1, 10, 2, 6, 5, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 720;
    got = maximum_product_of_three([7, 8, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -504;
    got = maximum_product_of_three([-7, -8, -9, -10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 720;
    got = maximum_product_of_three([-4, -3, -2, -1, 60]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
