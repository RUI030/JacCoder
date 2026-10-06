import from main { reverse_string }

test "case 0" {
    want = 'olleh';
    got = reverse_string('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'dlrow';
    got = reverse_string('world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'nohtyP';
    got = reverse_string('Python');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = reverse_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'a';
    got = reverse_string('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'madam';
    got = reverse_string('madam');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'racecar';
    got = reverse_string('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'abA';
    got = reverse_string('Aba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'fEdCbA';
    got = reverse_string('AbCdEf');
    assert got == want, f"expected={want!r} actual={got!r}";
}
