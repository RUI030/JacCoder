import from main { sanitize_string }

test "case 0" {
    want = 'hello world';
    got = sanitize_string('  hello world! ', '!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'goodbye';
    got = sanitize_string('@@goodbye##', '@#');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Python';
    got = sanitize_string('***Python***', '*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = sanitize_string('   ', ' ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = sanitize_string('', '@');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'no special# chars';
    got = sanitize_string('  no special# chars! ', '#!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Just@@@  whitespace';
    got = sanitize_string('###Just@@@  whitespace$$$  ', '#$@ ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'leading only';
    got = sanitize_string('   leading only!!!', '! ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'both sides';
    got = sanitize_string('###both sides!!!###', '#!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'special!! chars!! middle';
    got = sanitize_string('special!! chars!! middle', '! ');
    assert got == want, f"expected={want!r} actual={got!r}";
}
