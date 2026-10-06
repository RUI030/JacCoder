import from main { reverse_string }

test "case 0" {
    want = '';
    got = reverse_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'a';
    got = reverse_string('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'olleh';
    got = reverse_string('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'racecar';
    got = reverse_string('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'fed cba';
    got = reverse_string('abc def');
    assert got == want, f"expected={want!r} actual={got!r}";
}
