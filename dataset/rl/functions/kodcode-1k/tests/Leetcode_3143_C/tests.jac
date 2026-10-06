import from main { sortStringByCase }

test "case 0" {
    want = 'ABC';
    got = sortStringByCase('ABC');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'abc';
    got = sortStringByCase('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'CABadb';
    got = sortStringByCase('aCAdBb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = sortStringByCase('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'a';
    got = sortStringByCase('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'A';
    got = sortStringByCase('A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'BDFHcegi';
    got = sortStringByCase('BcDeFgHi');
    assert got == want, f"expected={want!r} actual={got!r}";
}
