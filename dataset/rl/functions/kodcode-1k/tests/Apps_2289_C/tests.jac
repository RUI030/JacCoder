import from main { shift_string }

test "case 0" {
    want = 'zab';
    got = shift_string('xyz', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'bcd';
    got = shift_string('abc', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'abc';
    got = shift_string('abc', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'abc';
    got = shift_string('abc', 26);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'bcd';
    got = shift_string('abc', 27);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'a';
    got = shift_string('z', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'z';
    got = shift_string('a', 25);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'olssv';
    got = shift_string('hello', 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'btwqi';
    got = shift_string('world', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'nopqrstuvwxyzabcdefghijklm';
    got = shift_string('abcdefghijklmnopqrstuvwxyz', 13);
    assert got == want, f"expected={want!r} actual={got!r}";
}
