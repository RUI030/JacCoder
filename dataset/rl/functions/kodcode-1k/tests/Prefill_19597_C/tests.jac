import from main { int_to_binary }

test "case 0" {
    want = '0b101';
    got = int_to_binary(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '0b1010';
    got = int_to_binary(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '0b0';
    got = int_to_binary(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '0b11111111111111111111111111111111';
    got = int_to_binary(-1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '0b11111111111111111111111111111011';
    got = int_to_binary(-5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '0b11111111111111111111111111110110';
    got = int_to_binary(-10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '0b10000000000';
    got = int_to_binary(1024);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '0b100000000000';
    got = int_to_binary(2048);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '0b11111111111111111111110000000000';
    got = int_to_binary(-1024);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '0b11111111111111111111100000000000';
    got = int_to_binary(-2048);
    assert got == want, f"expected={want!r} actual={got!r}";
}
