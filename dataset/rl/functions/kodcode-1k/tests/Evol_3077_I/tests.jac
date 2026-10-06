import from main { first_non_repeated_character }

test "case 0" {
    want = 'r';
    got = first_non_repeated_character('teeter');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'o';
    got = first_non_repeated_character('total');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'w';
    got = first_non_repeated_character('swiss');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '_';
    got = first_non_repeated_character('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '_';
    got = first_non_repeated_character('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '_';
    got = first_non_repeated_character('zzxxzz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'a';
    got = first_non_repeated_character('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'a';
    got = first_non_repeated_character('aA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'A';
    got = first_non_repeated_character('Aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'a';
    got = first_non_repeated_character('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'b';
    got = first_non_repeated_character('abac');
    assert got == want, f"expected={want!r} actual={got!r}";
}
