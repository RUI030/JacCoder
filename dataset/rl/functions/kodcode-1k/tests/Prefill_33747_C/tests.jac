import from main { remove_text_between_delimiters }

test "case 0" {
    want = 'Hello  everyone';
    got = remove_text_between_delimiters('Hello [world] everyone', '[', ']');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Hello  everyone. Have a  day!';
    got = remove_text_between_delimiters('Hello [world] everyone. Have a [great] day!', '[', ']');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Hello world everyone';
    got = remove_text_between_delimiters('Hello world everyone', '[', ']');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Hello  world';
    got = remove_text_between_delimiters('Hello [[nested]] world', '[[', ']]');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Hello  everyone';
    got = remove_text_between_delimiters('Hello <world> everyone', '<', '>');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = remove_text_between_delimiters('', '[', ']');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Hello  everyone';
    got = remove_text_between_delimiters('Hello [] everyone', '[', ']');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Hello  everyone';
    got = remove_text_between_delimiters('Hello [ ] everyone', '[', ']');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'Hello world ';
    got = remove_text_between_delimiters('Hello world [everyone]', '[', ']');
    assert got == want, f"expected={want!r} actual={got!r}";
}
