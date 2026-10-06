import from main { transform_emails }

test "case 0" {
    want = ['john.doe@company.com', 'jane-doe@company.com'];
    got = transform_emails(['john.doe@example.com', 'jane-doe@example.net']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = transform_emails(['invalid@address', 'invalid']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['john.doe@company.com', 'jane-doe@company.com'];
    got = transform_emails(['john.doe@example.com', 'invalid@address', 'jane-doe@example.net']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['alice@company.com'];
    got = transform_emails(['alice@sub.example.com']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = transform_emails([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
