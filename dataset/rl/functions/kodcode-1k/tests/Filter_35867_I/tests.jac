import from main { sum_even_multiples_of_three }

test "case 0" {
    want = 36;
    got = sum_even_multiples_of_three([6, 3, 12, 18, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = sum_even_multiples_of_three([1, 3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 54;
    got = sum_even_multiples_of_three([2, 4, 9, 15, 21, 24, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = sum_even_multiples_of_three([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 6;
    got = sum_even_multiples_of_three([6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = sum_even_multiples_of_three([9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = sum_even_multiples_of_three([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
