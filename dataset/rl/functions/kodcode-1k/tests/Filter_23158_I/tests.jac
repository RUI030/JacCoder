import from main { text_to_morse }

test "case 0" {
    want = '.-';
    got = text_to_morse('A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '.----';
    got = text_to_morse('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '.... . .-.. .-.. --- / .-- --- .-. .-.. -..';
    got = text_to_morse('Hello World');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '.-.-.- --..--';
    got = text_to_morse('.,');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = text_to_morse('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '..--- ----- ..--- ..---';
    got = text_to_morse('2022');
    assert got == want, f"expected={want!r} actual={got!r}";
}
