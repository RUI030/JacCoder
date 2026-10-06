import from main { is_alphanumeric }

test "case 0" {
    want = True;
    got = is_alphanumeric('Python3');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_alphanumeric('Python38');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_alphanumeric('123456');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_alphanumeric('Python 3.8');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_alphanumeric('Hello, World!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_alphanumeric('Python 3_8');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_alphanumeric('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
