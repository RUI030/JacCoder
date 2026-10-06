import from main { sum_two_numbers }

test "case 0" {
    want = 9;
    got = sum_two_numbers(4, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 7;
    got = sum_two_numbers(0, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = sum_two_numbers(3, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -9;
    got = sum_two_numbers(-3, -6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 6;
    got = sum_two_numbers(-4, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
