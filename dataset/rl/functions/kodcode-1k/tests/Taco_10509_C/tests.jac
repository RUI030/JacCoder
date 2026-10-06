import from main { canFormPalindrome }

test "case 0" {
    want = 'YES';
    got = canFormPalindrome('aabb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = canFormPalindrome('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = canFormPalindrome('civic');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = canFormPalindrome('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = canFormPalindrome('aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = canFormPalindrome('aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'YES';
    got = canFormPalindrome('aabbc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'YES';
    got = canFormPalindrome('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'YES';
    got = canFormPalindrome('aabbccd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'YES';
    got = canFormPalindrome('abcdefghijklmnopqrstuvwxyzzyxwvutsrqponmlkjihgfedcba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'NO';
    got = canFormPalindrome('abcdefghijjihgfedcbaabcdefghijjihgfedcbaabcdefghij');
    assert got == want, f"expected={want!r} actual={got!r}";
}
