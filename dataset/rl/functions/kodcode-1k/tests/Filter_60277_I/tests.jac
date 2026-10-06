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
    want = 'madam';
    got = reverse_string('madam');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'racecar';
    got = reverse_string('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'a';
    got = reverse_string('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'z';
    got = reverse_string('z');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'dlrow olleh';
    got = reverse_string('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '  secaps gniliart dna gnidael  ';
    got = reverse_string('  leading and trailing spaces  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}
