import from main { reverse_and_capitalize }

test "case 0" {
    want = 'Hello';
    got = reverse_and_capitalize('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'World Hello';
    got = reverse_and_capitalize('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'World Hello';
    got = reverse_and_capitalize('  hello   world  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'World Hello';
    got = reverse_and_capitalize('HELLO WORLD');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'World Hello';
    got = reverse_and_capitalize('HeLLo WoRLd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = reverse_and_capitalize('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '';
    got = reverse_and_capitalize('     ');
    assert got == want, f"expected={want!r} actual={got!r}";
}
