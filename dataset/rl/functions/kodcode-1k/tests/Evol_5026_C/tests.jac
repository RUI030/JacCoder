import from main { first_non_repeating_character }

test "case 0" {
    want = 'w';
    got = first_non_repeating_character('swiss');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '_';
    got = first_non_repeating_character('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '_';
    got = first_non_repeating_character('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'd';
    got = first_non_repeating_character('abcdabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'c';
    got = first_non_repeating_character('ab c ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'a';
    got = first_non_repeating_character('aA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'x';
    got = first_non_repeating_character('x');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '@';
    got = first_non_repeating_character('a@&a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'e';
    got = first_non_repeating_character('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}
