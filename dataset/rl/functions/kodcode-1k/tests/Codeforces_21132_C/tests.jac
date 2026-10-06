import from main { count_even_sum_pairs }

test "case 0" {
    want = 4;
    got = count_even_sum_pairs(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = count_even_sum_pairs(4, [2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 6;
    got = count_even_sum_pairs(4, [1, 3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = count_even_sum_pairs(4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = count_even_sum_pairs(1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = count_even_sum_pairs(1, [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = count_even_sum_pairs(2, [2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = count_even_sum_pairs(2, [1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = count_even_sum_pairs(2, [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
