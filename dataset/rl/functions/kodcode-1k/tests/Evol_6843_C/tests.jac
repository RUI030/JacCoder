import from main { squares_of_even_numbers_greater_than_50 }

test "case 0" {
    want = [64, 144];
    got = squares_of_even_numbers_greater_than_50([3, 4, 7, 8, 12, 15, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [64, 144];
    got = squares_of_even_numbers_greater_than_50([3, -4, 7, -8, -12, 15, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = squares_of_even_numbers_greater_than_50([3, 7, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = squares_of_even_numbers_greater_than_50([2, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [100, 144];
    got = squares_of_even_numbers_greater_than_50([-3, 10, -5, 9, -12, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
