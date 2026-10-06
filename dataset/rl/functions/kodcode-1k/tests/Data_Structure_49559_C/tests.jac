import from main { is_valid_markup }

test "case 0" {
    want = True;
    got = is_valid_markup('<tag>content here</tag>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_valid_markup('[link]<tag>link within tag</tag>[/link]');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_valid_markup('<tag><tag></tag></tag>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_valid_markup('<tag>[link]content[/link]</tag>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_valid_markup('<tag></tag>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_valid_markup('<tag><tag></tag>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_valid_markup('<tag><tag></tag></link>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_valid_markup('<tag>[link]</[/tag>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_valid_markup('[link]</link>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_valid_markup('Just some text');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = is_valid_markup('<tag><tag>[link][/link]');
    assert got == want, f"expected={want!r} actual={got!r}";
}
