import from main { multiply_strings }

test "case 0" {
    want = '6';
    got = multiply_strings('2', '3');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '0';
    got = multiply_strings('0', '12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '0';
    got = multiply_strings('12345', '0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '81';
    got = multiply_strings('9', '9');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '561741';
    got = multiply_strings('123', '4567');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '121932631112635269';
    got = multiply_strings('123456789', '987654321');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '7006652';
    got = multiply_strings('1234', '5678');
    assert got == want, f"expected={want!r} actual={got!r}";
}
