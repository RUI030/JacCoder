import from main { replace_digits }

test "case 0" {
    want = 'The X quick brown fox jumps over X lazy dogs.';
    got = replace_digits('The 1 quick brown fox jumps over 13 lazy dogs.', 'X');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'X';
    got = replace_digits('1', 'X');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'abc#def#ghi#';
    got = replace_digits('abc123def456ghi789', '#');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'number bottles of beer on the wall, number bottles of beer.';
    got = replace_digits('99 bottles of beer on the wall, 99 bottles of beer.', 'number');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'No digits here!';
    got = replace_digits('No digits here!', 'X');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '_NUMBER_ is the number: _NUMBER_-_NUMBER_-_NUMBER_';
    got = replace_digits('501 is the number: 123-456-7890', '_NUMBER_');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '';
    got = replace_digits('', 'X');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Welcome to the year LONG_REPLACEMENT_STRING';
    got = replace_digits('Welcome to the year 2022', 'LONG_REPLACEMENT_STRING');
    assert got == want, f"expected={want!r} actual={got!r}";
}
