import from main { reverse_string }

test "case 0" {
    want = 'olleh';
    got = reverse_string('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '';
    got = reverse_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'madam';
    got = reverse_string('madam');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'dlrow olleh';
    got = reverse_string('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '  olleh  ';
    got = reverse_string('  hello  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '54321';
    got = reverse_string('12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}
