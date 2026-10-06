import from main { convert_string }

test "case 0" {
    want = 'Hello, World!';
    got = convert_string('Hello, World!', 'utf-8');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Hello, World!';
    got = convert_string('Hello, World!', 'ascii');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Error: Encoding/Decoding failed';
    got = convert_string('Привет, мир!', 'ascii');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Hello, World!';
    got = convert_string('Hello, World!', 'latin-1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Error: Encoding/Decoding failed';
    got = convert_string('こんにちは、世界！', 'latin-1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Hello, World!';
    got = convert_string('Hello, World!', 'ISO-8859-1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Error: Encoding/Decoding failed';
    got = convert_string('你好，世界！', 'ISO-8859-1');
    assert got == want, f"expected={want!r} actual={got!r}";
}
