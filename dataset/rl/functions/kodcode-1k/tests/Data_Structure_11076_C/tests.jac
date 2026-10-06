import from main { check_anagram }

test "case 0" {
    want = True;
    got = check_anagram('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = check_anagram('a', 'A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = check_anagram('apple', 'pleap');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = check_anagram('apple', 'leapp');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = check_anagram('apple', 'pleap ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = check_anagram('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = check_anagram('🍏', '🍏');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = check_anagram('🍏🍎🍐', '🍐🍎🍏');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = check_anagram('hello', 'oellh ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = check_anagram('!@# $%^', '^%$ #@!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = check_anagram('123abc', 'cba321');
    assert got == want, f"expected={want!r} actual={got!r}";
}
