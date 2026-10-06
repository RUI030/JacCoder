import from main { search_substring }

test "case 0" {
    want = 2;
    got = search_substring('hello', 'll');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = search_substring('aaaaa', 'bba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = search_substring('abcdef', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = search_substring('pineapple', 'apple');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = search_substring('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = search_substring('short', 'longerneedle');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = search_substring('exactmatch', 'exactmatch');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -1;
    got = search_substring('', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = search_substring('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}
