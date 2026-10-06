import from main { mask_credit_card_number }

test "case 0" {
    want = 'My credit card number is ************5678.';
    got = mask_credit_card_number('My credit card number is 1234567812345678.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '************5678';
    got = mask_credit_card_number('1234567812345678');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'No card number here!';
    got = mask_credit_card_number('No card number here!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'My card is ************3456 and another ************4321';
    got = mask_credit_card_number('My card is 1234567890123456 and another 8765432187654321');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '123456789012345 ************5678 123';
    got = mask_credit_card_number('123456789012345 1234567812345678 123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Ends with invalid length: 1234567890123';
    got = mask_credit_card_number('Ends with invalid length: 1234567890123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Multiple valid: ************3456, ************7654';
    got = mask_credit_card_number('Multiple valid: 1234567890123456, 9876543210987654');
    assert got == want, f"expected={want!r} actual={got!r}";
}
