import from main { longest_arith_seq_length }

test "case 0" {
    want = 3;
    got = longest_arith_seq_length([1, 5, 7, 8, 5, 3, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_arith_seq_length([3, 6, 9, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = longest_arith_seq_length([9, 4, 7, 2, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = longest_arith_seq_length([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = longest_arith_seq_length([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = longest_arith_seq_length([2, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = longest_arith_seq_length([-1, -5, -7, -8, -5, -3, -4, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 4;
    got = longest_arith_seq_length([-1, -2, -3, 0, 3, 6, -6, -9, -12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
