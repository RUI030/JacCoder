import from main { is_palindrome_permutation }

test "case 0" {
    want = True;
    got = is_palindrome_permutation('civic');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_palindrome_permutation('ivicc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_palindrome_permutation('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_palindrome_permutation('aabb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_palindrome_permutation('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_palindrome_permutation('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_palindrome_permutation('abcdefg');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_palindrome_permutation('aabbccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = is_palindrome_permutation('aaaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}
