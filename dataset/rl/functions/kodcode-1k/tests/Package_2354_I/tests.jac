import from main { product_of_unique_numbers }

test "case 0" {
    want = 24;
    got = product_of_unique_numbers([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = product_of_unique_numbers([1, 2, 2, 3, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = product_of_unique_numbers([1, 1, 2, 2, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = product_of_unique_numbers([-1, -2, -3, -3, -2, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = product_of_unique_numbers([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = product_of_unique_numbers([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = product_of_unique_numbers([1, 1, 2, 2, 3, 3, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -4;
    got = product_of_unique_numbers([1, -1, 2, -2, 1, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
