import from main { convert_ascii }

test "case 0" {
    want = 'Hello!';
    got = convert_ascii([72, 101, 108, 108, 111, 33]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Hello!';
    got = convert_ascii([72, 101, 108, 108, 111, 33, 200]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ' ~';
    got = convert_ascii([32, 126, 127]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ' !';
    got = convert_ascii([31, 32, 33]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = convert_ascii([127, 128, 129, 255, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'AB CD';
    got = convert_ascii([65, 66, 32, 255, 67, 68]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ' ';
    got = convert_ascii([32]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '~';
    got = convert_ascii([126]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = ' ~';
    got = convert_ascii([32, 126]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '';
    got = convert_ascii([0, 31, 127, 255]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = '';
    got = convert_ascii([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
