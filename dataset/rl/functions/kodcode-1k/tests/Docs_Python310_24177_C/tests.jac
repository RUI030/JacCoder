import from main { analyze_bit_counts }

test "case 0" {
    want = {3: ('0b11', 2), 7: ('0b111', 3)};
    got = analyze_bit_counts([3, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {-5: ('-0b101', 2), -8: ('-0b1000', 1)};
    got = analyze_bit_counts([-5, -8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {3: ('0b11', 2), -5: ('-0b101', 2), 0: ('0b0', 0)};
    got = analyze_bit_counts([3, -5, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {0: ('0b0', 0)};
    got = analyze_bit_counts([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {};
    got = analyze_bit_counts([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
