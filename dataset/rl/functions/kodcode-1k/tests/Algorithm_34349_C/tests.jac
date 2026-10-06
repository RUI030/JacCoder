import from main { encode_morse }

test "case 0" {
    want = '.... . .-.. .-.. ---';
    got = encode_morse('HELLO');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '.... . .-.. .-.. ---';
    got = encode_morse('HeLLo');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '.... . .-.. .-.. ---   .-- --- .-. .-.. -..';
    got = encode_morse('HELLO WORLD');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '.---- ..--- ...--';
    got = encode_morse('123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '.... . .-.. .-.. ---   .-- --- .-. .-.. -..   .---- ..--- ...--';
    got = encode_morse('HELLO WORLD 123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '.... . .-.. .-.. ---   .-- --- .-. .-.. -..';
    got = encode_morse('Hello World');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '- .... .. ...   .. ...   .-   - . ... -';
    got = encode_morse('This is a Test');
    assert got == want, f"expected={want!r} actual={got!r}";
}
