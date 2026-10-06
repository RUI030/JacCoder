import from main { sort_letters_keep_numbers }

test "case 0" {
    want = 'a1b3c2';
    got = sort_letters_keep_numbers('a1c3b2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'abc';
    got = sort_letters_keep_numbers('bac');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '1234';
    got = sort_letters_keep_numbers('1234');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'a3b1c5d2';
    got = sort_letters_keep_numbers('d3c1b5a2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = sort_letters_keep_numbers('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'a';
    got = sort_letters_keep_numbers('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '1';
    got = sort_letters_keep_numbers('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'a!b@c#1';
    got = sort_letters_keep_numbers('a!c@b#1');
    assert got == want, f"expected={want!r} actual={got!r}";
}
