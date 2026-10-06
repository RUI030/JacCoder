import from main { is_palindrome }

test "case 0" {
    want = True;
    got = is_palindrome('madam');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_palindrome('A man a plan a canal Panama');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_palindrome('Racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_palindrome('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_palindrome('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_palindrome('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_palindrome('Eva, can I see bees in a cave?');
    assert got == want, f"expected={want!r} actual={got!r}";
}
