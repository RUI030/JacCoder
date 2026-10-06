import from main { reverseEveryOther }

test "case 0" {
    want = 'Hello dlrow this si a tset';
    got = reverseEveryOther('Hello world this is a test');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Coding si fun';
    got = reverseEveryOther('Coding is fun');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'I evol programming';
    got = reverseEveryOther('I love programming');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = reverseEveryOther('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'A B C D E F';
    got = reverseEveryOther('A B C D E F');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'To eb or ton to eb';
    got = reverseEveryOther('To be or not to be');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'single';
    got = reverseEveryOther('single');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'two sdrow';
    got = reverseEveryOther('two words');
    assert got == want, f"expected={want!r} actual={got!r}";
}
