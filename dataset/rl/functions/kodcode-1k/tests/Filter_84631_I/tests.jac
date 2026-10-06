import from main { sum_of_even_numbers }

test "case 0" {
    want = 20;
    got = sum_of_even_numbers([2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = sum_of_even_numbers([1, 3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 12;
    got = sum_of_even_numbers([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = sum_of_even_numbers([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -12;
    got = sum_of_even_numbers([-2, -4, -5, -6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
