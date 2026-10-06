import from main { is_valid_bank_account }

test "case 0" {
    want = 'Valid';
    got = is_valid_bank_account('1234567890');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Invalid';
    got = is_valid_bank_account('12345678901');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Invalid';
    got = is_valid_bank_account('123456789');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Invalid';
    got = is_valid_bank_account('0123456789');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Invalid';
    got = is_valid_bank_account('12345a7890');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Invalid';
    got = is_valid_bank_account('12345 7890');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Invalid';
    got = is_valid_bank_account('12345-7890');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Valid';
    got = is_valid_bank_account('1111111111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'Valid';
    got = is_valid_bank_account('1234567890');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'Invalid';
    got = is_valid_bank_account('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'Invalid';
    got = is_valid_bank_account('0000000000');
    assert got == want, f"expected={want!r} actual={got!r}";
}
