import from main { min_cost_to_make_palindrome }

test "case 0" {
    want = 0;
    got = min_cost_to_make_palindrome(5, 3, 2, 'ababa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = min_cost_to_make_palindrome(6, 1, 2, 'aaaaab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = min_cost_to_make_palindrome(4, 5, 1, 'abba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = min_cost_to_make_palindrome(4, 5, 1, 'abbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = min_cost_to_make_palindrome(4, 5, 1, 'aabb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = min_cost_to_make_palindrome(4, 1, 5, 'abbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = min_cost_to_make_palindrome(4, 1, 5, 'abba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = min_cost_to_make_palindrome(6, 3, 10, 'abccba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = min_cost_to_make_palindrome(5, 2, 2, 'aabba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = min_cost_to_make_palindrome(5, 2, 2, 'ababa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 2;
    got = min_cost_to_make_palindrome(3, 2, 2, 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 0;
    got = min_cost_to_make_palindrome(7, 4, 1, 'racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 0;
    got = min_cost_to_make_palindrome(1, 1, 1, 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 0;
    got = min_cost_to_make_palindrome(1, 1, 1, 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}
