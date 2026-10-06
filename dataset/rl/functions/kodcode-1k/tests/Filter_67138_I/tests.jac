import from main { shift_string_right }

test "case 0" {
    want = 'dabc';
    got = shift_string_right('abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'a';
    got = shift_string_right('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = shift_string_right('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'aaaa';
    got = shift_string_right('aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '4123';
    got = shift_string_right('1234');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '$!@#';
    got = shift_string_right('!@#$');
    assert got == want, f"expected={want!r} actual={got!r}";
}
