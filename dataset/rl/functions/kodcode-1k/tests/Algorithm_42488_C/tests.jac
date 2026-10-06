import from main { custom_string_reverser }

test "case 0" {
    want = 'c,b$a';
    got = custom_string_reverser('a,b$c');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'eD,c?!bA';
    got = custom_string_reverser('Ab,c?!De');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'edcba';
    got = custom_string_reverser('abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '12345';
    got = custom_string_reverser('12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = custom_string_reverser('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'c1b2a3';
    got = custom_string_reverser('a1b2c3');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'o l l e h';
    got = custom_string_reverser('h e l l o');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'd!c@b#a$';
    got = custom_string_reverser('a!b@c#d$');
    assert got == want, f"expected={want!r} actual={got!r}";
}
