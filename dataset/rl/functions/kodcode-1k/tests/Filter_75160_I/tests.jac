import from main { product_of_list }

test "case 0" {
    want = 120;
    got = product_of_list([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = product_of_list([1, 2, 0, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -120;
    got = product_of_list([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 120;
    got = product_of_list([1, -2, 3, -4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 7;
    got = product_of_list([7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = product_of_list([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
