import from main { validate_username }

test "case 0" {
    want = 'Valid';
    got = validate_username('johnsmith');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Valid';
    got = validate_username('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Valid';
    got = validate_username('zxywpt');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Invalid';
    got = validate_username('Johnsmith');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Invalid';
    got = validate_username('johnSmith');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Invalid';
    got = validate_username('john_smith');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Invalid';
    got = validate_username('john@smith');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Invalid';
    got = validate_username('user123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'Invalid';
    got = validate_username('123abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'Invalid';
    got = validate_username('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'Invalid';
    got = validate_username('abcdefghijklmno');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'Invalid';
    got = validate_username('abcdefghijklmnop');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 'Invalid';
    got = validate_username('aacccbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 'Invalid';
    got = validate_username('aabbccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 'Invalid';
    got = validate_username('abcdefghi');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 'Invalid';
    got = validate_username('lmnopqrst');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = 'Invalid';
    got = validate_username('zyxwvuts');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 17" {
    want = 'Invalid';
    got = validate_username('gfedcba');
    assert got == want, f"expected={want!r} actual={got!r}";
}
