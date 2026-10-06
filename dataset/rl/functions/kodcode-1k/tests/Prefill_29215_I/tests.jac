import from main { find_duplicate_characters }

test "case 0" {
    want = set();
    got = find_duplicate_characters('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'a', 'b', 'c'};
    got = find_duplicate_characters('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'a', 'b', 'c'};
    got = find_duplicate_characters('abccba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = set();
    got = find_duplicate_characters('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = set();
    got = find_duplicate_characters('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {'A', 'a'};
    got = find_duplicate_characters('aAaA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = {'a', '1'};
    got = find_duplicate_characters('a1b2a1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = {'!', '@', '#'};
    got = find_duplicate_characters('!@#!@#');
    assert got == want, f"expected={want!r} actual={got!r}";
}
