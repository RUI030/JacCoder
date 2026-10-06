import from main { can_form_palindrome }

test "case 0" {
    want = 'YES';
    got = can_form_palindrome(121);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = can_form_palindrome(3443);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = can_form_palindrome(1221);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = can_form_palindrome(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = can_form_palindrome(44444);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = can_form_palindrome(123);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'NO';
    got = can_form_palindrome(321);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'NO';
    got = can_form_palindrome(12345);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'NO';
    got = can_form_palindrome(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'YES';
    got = can_form_palindrome(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'YES';
    got = can_form_palindrome(11);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'NO';
    got = can_form_palindrome(12);
    assert got == want, f"expected={want!r} actual={got!r}";
}
