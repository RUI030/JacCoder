import from main { sum_of_overlapping_bits }

test "case 0" {
    want = 6;
    got = sum_of_overlapping_bits(['010', '101'], ['010', '101']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = sum_of_overlapping_bits(['000', '000'], ['000', '000']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 6;
    got = sum_of_overlapping_bits(['111', '111'], ['111', '111']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = sum_of_overlapping_bits(['010', '101'], ['101', '010']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = sum_of_overlapping_bits(['1100', '0011'], ['1011', '1010']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = sum_of_overlapping_bits(['010'], ['010', '101']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = sum_of_overlapping_bits(['010', '101'], ['010']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = sum_of_overlapping_bits([], ['010', '101']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = sum_of_overlapping_bits(['010', '101'], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = sum_of_overlapping_bits([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}
