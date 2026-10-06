import from main { remove_adjacent_duplicates }

test "case 0" {
    want = 'abc';
    got = remove_adjacent_duplicates('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'abc';
    got = remove_adjacent_duplicates('aaabbbccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'abcdef';
    got = remove_adjacent_duplicates('aabbccddeeff');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'a';
    got = remove_adjacent_duplicates('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = remove_adjacent_duplicates('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '!@!';
    got = remove_adjacent_duplicates('!!@@!!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '$#$';
    got = remove_adjacent_duplicates('$$$###$$$');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'AaAaBbBb';
    got = remove_adjacent_duplicates('AaAaBbBb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'aA';
    got = remove_adjacent_duplicates('aaAA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'abcdef';
    got = remove_adjacent_duplicates('abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'k';
    got = remove_adjacent_duplicates('kkkkk');
    assert got == want, f"expected={want!r} actual={got!r}";
}
