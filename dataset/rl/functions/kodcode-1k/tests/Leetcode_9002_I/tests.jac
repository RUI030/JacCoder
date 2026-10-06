import from main { can_form_palindrome }

test "case 0" {
    want = True;
    got = can_form_palindrome('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = can_form_palindrome('aabbc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = can_form_palindrome('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = can_form_palindrome('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = can_form_palindrome('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = can_form_palindrome('aaaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = can_form_palindrome('aaabbccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}
