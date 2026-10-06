import from main { find_unique_characters }

test "case 0" {
    want = ['h', 'e', ' ', 'w', 'r', 'd'];
    got = find_unique_characters('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['a', 'b', 'c', ' ', 'd', 'e', 'f'];
    got = find_unique_characters('abc def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = find_unique_characters('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [' ', 'd'];
    got = find_unique_characters('abcabc dabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = find_unique_characters('     ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = find_unique_characters('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ['a'];
    got = find_unique_characters('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}
