import from main { is_permutation_of_palindrome }

test "case 0" {
    want = True;
    got = is_permutation_of_palindrome('Tact Coa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_permutation_of_palindrome('aab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_permutation_of_palindrome('code');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_permutation_of_palindrome('abcdefg');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_permutation_of_palindrome('A man, a plan, a canal, Panama!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_permutation_of_palindrome('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_permutation_of_palindrome('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_permutation_of_palindrome('aaabbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = is_permutation_of_palindrome('aaabb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_permutation_of_palindrome('No lemon, no melon!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = is_permutation_of_palindrome('Not a palindrome');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = is_permutation_of_palindrome('Was it a car or a cat I saw?');
    assert got == want, f"expected={want!r} actual={got!r}";
}
