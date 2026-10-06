import from main { group_anagrams }

test "case 0" {
    want = [['bat', 'tab'], ['cat', 'act'], ['dog', 'god']];
    got = group_anagrams(['bat', 'tab', 'cat', 'act', 'dog', 'god']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [['']];
    got = group_anagrams(['']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [['a']];
    got = group_anagrams(['a']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [['ab', 'ba'], ['abc', 'bca', 'cab'], ['dab']];
    got = group_anagrams(['ab', 'ba', 'abc', 'bca', 'cab', 'dab']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [['listen', 'silent', 'enlist'], ['google'], ['gooogle']];
    got = group_anagrams(['listen', 'silent', 'enlist', 'google', 'gooogle']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
