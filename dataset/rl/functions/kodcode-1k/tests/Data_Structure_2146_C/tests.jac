import from main { find_unique_product_id }

test "case 0" {
    want = 4;
    got = find_unique_product_id([4, 1, 2, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -4;
    got = find_unique_product_id([-1, -2, -3, -2, -3, -1, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = find_unique_product_id([3, 3, 2, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = find_unique_product_id([7, 3, 5, 4, 5, 3, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 99;
    got = find_unique_product_id([99]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
