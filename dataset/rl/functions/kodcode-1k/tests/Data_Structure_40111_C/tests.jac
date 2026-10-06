import from main { reverse_string }

test "case 0" {
    want = 'olleh';
    got = reverse_string('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'amanaP ,lanac a ,nalp a ,nam A';
    got = reverse_string('A man, a plan, a canal, Panama');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = reverse_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'a';
    got = reverse_string('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '0987654321';
    got = reverse_string('1234567890');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'GfEdCbA';
    got = reverse_string('AbCdEfG');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ')(*&^%$#@!';
    got = reverse_string('!@#$%^&*()');
    assert got == want, f"expected={want!r} actual={got!r}";
}
