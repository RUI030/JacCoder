import from main { int_to_padded_binary }

test "case 0" {
    want = '00000101';
    got = int_to_padded_binary(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '00000000';
    got = int_to_padded_binary(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '11111111';
    got = int_to_padded_binary(255);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '100000000';
    got = int_to_padded_binary(256);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '-0000001';
    got = int_to_padded_binary(-1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
