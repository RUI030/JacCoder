import from main { smallestNumber }

test "case 0" {
    want = '1243';
    got = smallestNumber('15243');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '000';
    got = smallestNumber('1000');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '1';
    got = smallestNumber('21');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '7';
    got = smallestNumber('7');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '12';
    got = smallestNumber('123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '87654321';
    got = smallestNumber('987654321');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '0200';
    got = smallestNumber('10200');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '0002';
    got = smallestNumber('10002');
    assert got == want, f"expected={want!r} actual={got!r}";
}
