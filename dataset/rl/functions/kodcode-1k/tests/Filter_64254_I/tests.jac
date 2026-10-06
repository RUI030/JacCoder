import from main { clean_string }

test "case 0" {
    want = 'Hello World 123';
    got = clean_string('Hello World 123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'HelloWorld 123';
    got = clean_string('Hello@World! 123,;');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = clean_string('!@#$%^&*()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'HelloWorld123';
    got = clean_string('Hello_World-123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = clean_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
