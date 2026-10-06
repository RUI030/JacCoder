import from main { is_valid_email }

test "case 0" {
    want = 'YES';
    got = is_valid_email('john.doe@example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = is_valid_email('johndoeexample.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'NO';
    got = is_valid_email('@example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = is_valid_email('john.doe@');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = is_valid_email('john.doe@examplecom');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = is_valid_email('john.doe@exAAmple.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'NO';
    got = is_valid_email('john.doe@example..com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'YES';
    got = is_valid_email('john.doe@sub.example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'YES';
    got = is_valid_email('john.doe@a.b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'NO';
    got = is_valid_email('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'NO';
    got = is_valid_email('@');
    assert got == want, f"expected={want!r} actual={got!r}";
}
