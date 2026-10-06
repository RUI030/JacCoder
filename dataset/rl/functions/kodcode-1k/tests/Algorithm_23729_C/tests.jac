import from main { can_form_palindrome }

test "case 0" {
    want = True;
    got = can_form_palindrome('civic');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = can_form_palindrome('ivicc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = can_form_palindrome('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = can_form_palindrome('aab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = can_form_palindrome('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = can_form_palindrome('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = can_form_palindrome('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = can_form_palindrome('aabbccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = can_form_palindrome('aabbccddeffg');
    assert got == want, f"expected={want!r} actual={got!r}";
}
