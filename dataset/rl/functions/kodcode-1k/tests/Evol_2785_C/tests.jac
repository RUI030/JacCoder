import from main { character_count }

test "case 0" {
    want = {'P': 1, 'r': 2, 'o': 1, 'g': 2, 'a': 1, 'm': 2, 'i': 1, 'n': 1};
    got = character_count('Programming');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {};
    got = character_count('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'a': 1};
    got = character_count('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {'A': 1};
    got = character_count('A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'A': 1, 'a': 1};
    got = character_count('Aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {'a': 3, '!': 2, '@': 1};
    got = character_count('a!a!a@');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = {'1': 3, '2': 2, '3': 2};
    got = character_count('1231123');
    assert got == want, f"expected={want!r} actual={got!r}";
}
