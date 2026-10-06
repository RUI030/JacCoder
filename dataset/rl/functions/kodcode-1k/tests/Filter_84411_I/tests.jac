import from main { string_to_ascii_values }

test "case 0" {
    want = [];
    got = string_to_ascii_values('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [65];
    got = string_to_ascii_values('A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [97];
    got = string_to_ascii_values('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [49];
    got = string_to_ascii_values('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [32];
    got = string_to_ascii_values(' ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [65, 66, 67];
    got = string_to_ascii_values('ABC');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [97, 98, 99];
    got = string_to_ascii_values('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [49, 50, 51];
    got = string_to_ascii_values('123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [65, 49, 97];
    got = string_to_ascii_values('A1a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [33, 64, 35];
    got = string_to_ascii_values('!@#');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = [126, 96, 124];
    got = string_to_ascii_values('~`|');
    assert got == want, f"expected={want!r} actual={got!r}";
}
