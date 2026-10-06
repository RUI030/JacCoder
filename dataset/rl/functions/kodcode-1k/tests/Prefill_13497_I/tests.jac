import from main { sum_of_numbers }

test "case 0" {
    want = 15;
    got = sum_of_numbers(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = sum_of_numbers(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = sum_of_numbers(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5050;
    got = sum_of_numbers(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
