import from main { validate_password }

test "case 0" {
    want = 'Password is valid';
    got = validate_password('Valid1@password');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Password is invalid';
    got = validate_password('Shrt1@');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Password is invalid';
    got = validate_password('valid1@password');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Password is invalid';
    got = validate_password('VALID1@PASSWORD');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Password is invalid';
    got = validate_password('Valid@password');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Password is invalid';
    got = validate_password('Valid1password');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Password is valid';
    got = validate_password('AllCriteria1@Met');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Password is invalid';
    got = validate_password('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
