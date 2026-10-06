import from main { is_rotation }

test "case 0" {
    want = 'YES';
    got = is_rotation('abcd', 'dabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = is_rotation('hello', 'lohel');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = is_rotation('rotation', 'tationro');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = is_rotation('123456', '456123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = is_rotation('abc', 'acb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = is_rotation('abcd', 'abdc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'NO';
    got = is_rotation('1234', '3214');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'YES';
    got = is_rotation('same', 'same');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'NO';
    got = is_rotation('short', 'longer');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'YES';
    got = is_rotation('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}
