import from main { can_form_palindrome }

test "case 0" {
    want = True;
    got = can_form_palindrome('Tact Coa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = can_form_palindrome('Able was I ere I saw Elba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = can_form_palindrome('Hello World');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = can_form_palindrome('A man, a plan, a canal, Panama');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = can_form_palindrome("No 'x' in Nixon");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = can_form_palindrome('Was it a car or a cat I saw');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = can_form_palindrome('12321');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = can_form_palindrome('1234554321');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = can_form_palindrome('12345654321');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = can_form_palindrome('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = can_form_palindrome('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = can_form_palindrome('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}
