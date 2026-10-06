import from main { translate_to_morse }

test "case 0" {
    want = '.... . .-.. .-.. --- / .-- --- .-. .-.. -.. / .---- ..--- ...--';
    got = translate_to_morse('Hello World 123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '.-';
    got = translate_to_morse('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '.-';
    got = translate_to_morse('A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '... --- ...';
    got = translate_to_morse('SOS');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '... --- ...';
    got = translate_to_morse('sos');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '-----';
    got = translate_to_morse('0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '.---- / ..--- / ...-- / ....- / ..... / -.... / --... / ---.. / ----.';
    got = translate_to_morse('1 2 3 4 5 6 7 8 9');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '.... . .-.. .-.. --- /';
    got = translate_to_morse('Hello!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '-- --- .-. ... . / / -.-. --- -.. . /';
    got = translate_to_morse('Morse  Code!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '';
    got = translate_to_morse('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = '.... . .-.. .-.. --- / / .-- --- .-. .-.. -.. /';
    got = translate_to_morse('Hello, World!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = '/ / / / / / / / /';
    got = translate_to_morse('@#$%^&*()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = '.- / -... / -.-. / -.. / . / ..-. / --. / .... / .. / .---';
    got = translate_to_morse('A B C D E F G H I J');
    assert got == want, f"expected={want!r} actual={got!r}";
}
