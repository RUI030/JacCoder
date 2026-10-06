import from main { process_string }

test "case 0" {
    want = 'abc 0';
    got = process_string('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ' 10';
    got = process_string('1234');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'abc 6';
    got = process_string('a1b2c3');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'a 0';
    got = process_string('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ' 1';
    got = process_string('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'aaa 3';
    got = process_string('aaa111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'bbb 6';
    got = process_string('bbb222');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'zabcdefgh 45';
    got = process_string('z9a8b7c6d5e4f3g2h1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = ' 0';
    got = process_string('0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = ' 27';
    got = process_string('999');
    assert got == want, f"expected={want!r} actual={got!r}";
}
