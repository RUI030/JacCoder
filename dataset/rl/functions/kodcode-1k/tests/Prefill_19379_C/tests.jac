import from main { reverse_sum_of_digits }

test "case 0" {
    want = 5;
    got = reverse_sum_of_digits(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 321;
    got = reverse_sum_of_digits(123);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 7654;
    got = reverse_sum_of_digits(4567);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = reverse_sum_of_digits(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = reverse_sum_of_digits(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 321;
    got = reverse_sum_of_digits(-123);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 987654321;
    got = reverse_sum_of_digits(123456789);
    assert got == want, f"expected={want!r} actual={got!r}";
}
