import from main { highlight_emails }

test "case 0" {
    want = 'Contact us at [support@example.com] for more details.';
    got = highlight_emails('Contact us at support@example.com for more details.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Send an email to [admin@example.com] or [sales@example.co.uk].';
    got = highlight_emails('Send an email to admin@example.com or sales@example.co.uk.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Invalid emails: test@com, user@com.';
    got = highlight_emails('Invalid emails: test@com, user@com.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Emails: [user123@example.com], [another.user@sub.domain.com], [final_user@final-domain.org].';
    got = highlight_emails('Emails: user123@example.com, another.user@sub.domain.com, final_user@final-domain.org.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Please contact [support@sub.example.com] for assistance.';
    got = highlight_emails('Please contact support@sub.example.com for assistance.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Emails: [user@example.com], [user@example.co.uk], [user@example.org].';
    got = highlight_emails('Emails: user@example.com, user@example.co.uk, user@example.org.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Our emails: [contact@company.com], [info@business.org]. Visit our site for more info.';
    got = highlight_emails('Our emails: contact@company.com, info@business.org. Visit our site for more info.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Special emails: [someone+label@example.com], [name.surname@example.com].';
    got = highlight_emails('Special emails: someone+label@example.com, name.surname@example.com.');
    assert got == want, f"expected={want!r} actual={got!r}";
}
