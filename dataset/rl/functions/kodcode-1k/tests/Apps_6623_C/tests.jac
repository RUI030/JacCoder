import from main { wordPattern }

test "case 0" {
    want = True;
    got = wordPattern('abba', 'dog cat cat dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = wordPattern('abba', 'dog cat cat fish');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = wordPattern('aaaa', 'dog dog dog dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = wordPattern('abba', 'dog dog dog dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = wordPattern('abc', 'dog cat cat dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = wordPattern('abbaab', 'dog cat cat dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = wordPattern('abc', 'dog cat fish');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = wordPattern('ab', 'dog dog dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = wordPattern('abcd', 'one two three four');
    assert got == want, f"expected={want!r} actual={got!r}";
}
