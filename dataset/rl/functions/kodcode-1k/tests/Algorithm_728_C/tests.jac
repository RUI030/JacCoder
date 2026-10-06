import from main { can_permute_palindrome }

test "case 0" {
    want = True;
    got = can_permute_palindrome('civic');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = can_permute_palindrome('ivicc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = can_permute_palindrome('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = can_permute_palindrome('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = can_permute_palindrome('aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = can_permute_palindrome('ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = can_permute_palindrome('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = can_permute_palindrome('aabbccdd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = can_permute_palindrome('aabbccdde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = can_permute_palindrome('aabbccddeeff');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = can_permute_palindrome('abcdefghijklmnopqrstuvwxyza');
    assert got == want, f"expected={want!r} actual={got!r}";
}
