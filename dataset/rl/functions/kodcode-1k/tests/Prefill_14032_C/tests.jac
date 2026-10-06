import from main { transform_string }

test "case 0" {
    want = 'HELLO';
    got = transform_string('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'TESTING';
    got = transform_string('testing');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '12345';
    got = transform_string('12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Error: String is too short.';
    got = transform_string('hi');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Error: String is too short.';
    got = transform_string('test');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Error: String is too short.';
    got = transform_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Error: String is too short.';
    got = transform_string('1234');
    assert got == want, f"expected={want!r} actual={got!r}";
}
