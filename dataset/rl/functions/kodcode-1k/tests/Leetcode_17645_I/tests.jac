import from main { min_removals_to_make_valid_palindrome }

test "case 0" {
    want = 0;
    got = min_removals_to_make_valid_palindrome('abccba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_removals_to_make_valid_palindrome('aabbc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = min_removals_to_make_valid_palindrome('aaabbbc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = min_removals_to_make_valid_palindrome('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = min_removals_to_make_valid_palindrome('aaabbbccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}
