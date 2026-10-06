import from main { normalize_text }

test "case 0" {
    want = 'hello world';
    got = normalize_text(' Hello   World ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'this is a test string';
    got = normalize_text('This    is    a Test   String');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = normalize_text('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = normalize_text('     ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'singleword';
    got = normalize_text(' SINGLEword ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'multiple spaces between';
    got = normalize_text('   multiple   spaces  between  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'all uppercase letters';
    got = normalize_text('ALL UPPERCASE LETTERS');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'mixed case string';
    got = normalize_text('MixEd CaSe StriNG');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'leading and trailing spaces';
    got = normalize_text('  leading and trailing spaces  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}
