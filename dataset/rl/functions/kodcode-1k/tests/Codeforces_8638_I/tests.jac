import from main { count_even_sum_pairs }

test "case 0" {
    want = 2;
    got = count_even_sum_pairs(4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = count_even_sum_pairs(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 15;
    got = count_even_sum_pairs(6, [2, 2, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = count_even_sum_pairs(3, [1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = count_even_sum_pairs(3, [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 9;
    got = count_even_sum_pairs(7, [1, 2, 3, 4, 5, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = count_even_sum_pairs(2, [1, 100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = count_even_sum_pairs(2, [2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
