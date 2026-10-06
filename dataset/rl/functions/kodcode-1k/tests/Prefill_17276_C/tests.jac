import from main { first_digit_sum }

test "case 0" {
    want = 6;
    got = first_digit_sum(123);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = first_digit_sum(123.45);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 15;
    got = first_digit_sum(-456);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 15;
    got = first_digit_sum(-78.91);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = first_digit_sum(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 7;
    got = first_digit_sum(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 8;
    got = first_digit_sum(-8);
    assert got == want, f"expected={want!r} actual={got!r}";
}
