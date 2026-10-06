import from main { check_email }

test "case 0" {
    want = 'Valid Email';
    got = check_email('test.email@example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Invalid Email';
    got = check_email('test.email.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Invalid Email';
    got = check_email('test.email@com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Invalid Email';
    got = check_email('test.email!@example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Valid Email';
    got = check_email('test.email@sub.example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Valid Email';
    got = check_email('test.email+1@example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Invalid Email';
    got = check_email('test@.email@example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Valid Email';
    got = check_email('test-email@example.com');
    assert got == want, f"expected={want!r} actual={got!r}";
}
