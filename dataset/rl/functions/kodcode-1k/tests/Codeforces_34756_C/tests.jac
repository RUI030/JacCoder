import from main { longest_palindrome_length }

test "case 0" {
    want = 7;
    got = longest_palindrome_length('abccccdd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = longest_palindrome_length('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = longest_palindrome_length('aaabbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = longest_palindrome_length('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 5;
    got = longest_palindrome_length('aaaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = longest_palindrome_length('abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 9;
    got = longest_palindrome_length('abccccddaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 5;
    got = longest_palindrome_length('zzzzz');
    assert got == want, f"expected={want!r} actual={got!r}";
}
