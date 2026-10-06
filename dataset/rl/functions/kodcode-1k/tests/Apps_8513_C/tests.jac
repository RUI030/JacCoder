import from main { shift_string_2 }

test "case 0" {
    want = 'cde';
    got = shift_string_2('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'zab';
    got = shift_string_2('xyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'ab';
    got = shift_string_2('yz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'c';
    got = shift_string_2('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'b';
    got = shift_string_2('z');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'cdefghijkl';
    got = shift_string_2('abcdefghij');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'wxyzab';
    got = shift_string_2('uvwxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}
