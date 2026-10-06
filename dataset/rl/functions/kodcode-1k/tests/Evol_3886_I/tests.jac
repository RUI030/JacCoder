import from main { first_non_repeating_char }

test "case 0" {
    want = 'w';
    got = first_non_repeating_char('swiss');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'r';
    got = first_non_repeating_char('repetition');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = None;
    got = first_non_repeating_char('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'a';
    got = first_non_repeating_char('abcdefghijklmnopqrstuvwxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = None;
    got = first_non_repeating_char('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'd';
    got = first_non_repeating_char('aabbccd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = None;
    got = first_non_repeating_char('abcabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'z';
    got = first_non_repeating_char('z');
    assert got == want, f"expected={want!r} actual={got!r}";
}
