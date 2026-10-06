import from main { verify_captcha }

test "case 0" {
    want = True;
    got = verify_captcha('aB3kL', 'aB3kL');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = verify_captcha('XyZ12', 'xyz12');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = verify_captcha('G7d2Q', 'G7d2o');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = verify_captcha('nMv5e', 'nMv5');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = verify_captcha('nMv5e', 'nMv5ee');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = verify_captcha('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = verify_captcha('G9K5L', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}
