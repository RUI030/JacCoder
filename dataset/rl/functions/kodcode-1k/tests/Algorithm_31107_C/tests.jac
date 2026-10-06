import from main { longest_zero_sequence }

test "case 0" {
    want = 4;
    got = longest_zero_sequence('110001000010011000');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = longest_zero_sequence('00000');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = longest_zero_sequence('11111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = longest_zero_sequence('1010101010');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = longest_zero_sequence('0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = longest_zero_sequence('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = longest_zero_sequence('010100');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = longest_zero_sequence('1100110011');
    assert got == want, f"expected={want!r} actual={got!r}";
}
