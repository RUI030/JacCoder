import from main { coupon_combinations }

test "case 0" {
    want = 7;
    got = coupon_combinations([1, 2, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = coupon_combinations([2, 3, 6, 7], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = coupon_combinations([2, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = coupon_combinations([5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = coupon_combinations([5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 274;
    got = coupon_combinations([1, 2, 3], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = coupon_combinations([1, 2, 3], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 464;
    got = coupon_combinations([1, 2, 3, 4, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
