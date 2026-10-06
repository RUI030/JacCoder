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
    want = False;
    got = wordPattern('aaaa', 'dog cat cat dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = wordPattern('abba', 'dog dog dog dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = wordPattern('abc', 'dog cat');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = wordPattern('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = wordPattern('a', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = wordPattern('', 'dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}
