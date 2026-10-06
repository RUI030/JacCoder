import from main { string_to_ascii_list }

test "case 0" {
    want = [];
    got = string_to_ascii_list('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [97];
    got = string_to_ascii_list('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [90];
    got = string_to_ascii_list('Z');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [97, 98, 99];
    got = string_to_ascii_list('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [72, 101, 108, 108, 111];
    got = string_to_ascii_list('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [33, 64, 35];
    got = string_to_ascii_list('!@#');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [49, 50, 51];
    got = string_to_ascii_list('123');
    assert got == want, f"expected={want!r} actual={got!r}";
}
