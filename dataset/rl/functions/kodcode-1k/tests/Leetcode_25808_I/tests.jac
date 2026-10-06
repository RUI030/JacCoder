import from main { sum_even_nums_or_even_index }

test "case 0" {
    want = 30;
    got = sum_even_nums_or_even_index([2, 4, 6, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 15;
    got = sum_even_nums_or_even_index([1, 3, 5, 7, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 21;
    got = sum_even_nums_or_even_index([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = sum_even_nums_or_even_index([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = sum_even_nums_or_even_index([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = sum_even_nums_or_even_index([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
