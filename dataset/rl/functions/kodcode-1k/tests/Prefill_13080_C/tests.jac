import from main { sum_of_digits_of_largest_number }

test "case 0" {
    want = 5;
    got = sum_of_digits_of_largest_number([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = sum_of_digits_of_largest_number([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 24;
    got = sum_of_digits_of_largest_number([123, 456, 789]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 9;
    got = sum_of_digits_of_largest_number([9, 18, 27, 36]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = sum_of_digits_of_largest_number([111, 111]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 12;
    got = sum_of_digits_of_largest_number([222, 111, 333, 444]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = sum_of_digits_of_largest_number([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 30;
    got = sum_of_digits_of_largest_number([12345, 67890, 9876]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
