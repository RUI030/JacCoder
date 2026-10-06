import from main { word_mirror_madness }

test "case 0" {
    want = 'olleh dlrow';
    got = word_mirror_madness('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'gnidoc si nuf';
    got = word_mirror_madness('coding is fun');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ',olleh !dlrow';
    got = word_mirror_madness('hello, world!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '  olleh   dlrow  ';
    got = word_mirror_madness('  hello   world  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'elpmaxe';
    got = word_mirror_madness('example');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = word_mirror_madness('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
