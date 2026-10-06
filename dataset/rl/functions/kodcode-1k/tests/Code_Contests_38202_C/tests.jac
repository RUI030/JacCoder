import from main { binary_to_string }

test "case 0" {
    want = 'Hello';
    got = binary_to_string('0100100001100101011011000110110001101111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'hi';
    got = binary_to_string('0110100001101001');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ' ';
    got = binary_to_string('00100000');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '12';
    got = binary_to_string('0011000100110010');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'ABC ii,';
    got = binary_to_string('01000001010000100100001100100000011010010110100100101100');
    assert got == want, f"expected={want!r} actual={got!r}";
}
