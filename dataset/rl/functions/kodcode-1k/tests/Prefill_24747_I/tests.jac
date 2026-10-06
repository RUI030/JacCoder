import from main { sum_or_product }

test "case 0" {
    want = 6;
    got = sum_or_product(2, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = sum_or_product(2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = sum_or_product(0, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -2;
    got = sum_or_product(-2, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -6;
    got = sum_or_product(-2, -4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = sum_or_product(-2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
