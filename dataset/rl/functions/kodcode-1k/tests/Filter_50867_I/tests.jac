import from main { filter_strings_by_length_and_content }

test "case 0" {
    want = ['apple', 'grape'];
    got = filter_strings_by_length_and_content(['apple', 'banana', 'kiwi', 'grape'], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['kiwi'];
    got = filter_strings_by_length_and_content(['app!e', 'ban*na', 'kiwi', 'gr@pe'], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['kiwi'];
    got = filter_strings_by_length_and_content(['appl3', 'banan2', 'kiwi', 'gra9e'], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['kIwI'];
    got = filter_strings_by_length_and_content(['APPLE', 'BaNaNA', 'kIwI', 'GnQrE'], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = filter_strings_by_length_and_content([], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = filter_strings_by_length_and_content(['dog', 'cat', 'pigeon', 'elephant'], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = filter_strings_by_length_and_content(['12345', '12#45', '123 5'], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
