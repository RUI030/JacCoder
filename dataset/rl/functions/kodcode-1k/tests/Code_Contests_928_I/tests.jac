import from main { are_permutations }

test "case 0" {
    want = True;
    got = are_permutations('abcd', 'bcda');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = are_permutations('abcde', 'edcba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = are_permutations('abcd', 'efg');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = are_permutations('xyz', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = are_permutations('abcd', 'abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = are_permutations('a', 'aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = are_permutations('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = are_permutations('abcd', 'ABCD');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = are_permutations('AbcD', 'abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = are_permutations('!@#$', '$#@!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = are_permutations('!@#$', '!@#$%^');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = are_permutations('1234', '4321');
    assert got == want, f"expected={want!r} actual={got!r}";
}
