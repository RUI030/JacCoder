import from main { max_sum_of_product }

test "case 0" {
    want = 100;
    got = max_sum_of_product([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = max_sum_of_product([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 14;
    got = max_sum_of_product([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 14;
    got = max_sum_of_product([-1, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 55;
    got = max_sum_of_product([1, 5, 3, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 35;
    got = max_sum_of_product([-5, -3, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
