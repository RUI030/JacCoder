import from main { min_operations_to_palindrome }

test "case 0" {
    want = 0;
    got = min_operations_to_palindrome('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_operations_to_palindrome('abba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = min_operations_to_palindrome('abca');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = min_operations_to_palindrome('abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = min_operations_to_palindrome('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = min_operations_to_palindrome('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = min_operations_to_palindrome('abccba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = min_operations_to_palindrome('abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}
