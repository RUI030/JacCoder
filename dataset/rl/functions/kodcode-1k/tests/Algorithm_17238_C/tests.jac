import from main { capitalize_first_letter }

test "case 0" {
    want = 'Hello';
    got = capitalize_first_letter('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Hello World';
    got = capitalize_first_letter('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'This Is A Test Sentence';
    got = capitalize_first_letter('this is a test sentence');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Capitalize This Sentence';
    got = capitalize_first_letter('CAPITALIZE THIS SENTENCE');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = capitalize_first_letter('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'This Is A Test';
    got = capitalize_first_letter('this   is    a test');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'A B C D E F G';
    got = capitalize_first_letter('a b c d e f g');
    assert got == want, f"expected={want!r} actual={got!r}";
}
