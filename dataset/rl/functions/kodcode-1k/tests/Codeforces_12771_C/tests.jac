import from main { rotate_string }

test "case 0" {
    want = 'cdefab';
    got = rotate_string('abcdef', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'xyz';
    got = rotate_string('xyz', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'hello';
    got = rotate_string('hello', 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'rotate';
    got = rotate_string('rotate', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'cdab';
    got = rotate_string('abcd', 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'abcd';
    got = rotate_string('abcd', 12);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'a';
    got = rotate_string('a', 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'a';
    got = rotate_string('a', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '';
    got = rotate_string('', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
