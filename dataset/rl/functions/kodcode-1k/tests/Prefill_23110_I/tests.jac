import from main { sum_of_digits }

test "case 0" {
    want = 6;
    got = sum_of_digits(123);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = sum_of_digits(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 6;
    got = sum_of_digits(-123);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = sum_of_digits(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 8;
    got = sum_of_digits(-8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 45;
    got = sum_of_digits(123456789);
    assert got == want, f"expected={want!r} actual={got!r}";
}
