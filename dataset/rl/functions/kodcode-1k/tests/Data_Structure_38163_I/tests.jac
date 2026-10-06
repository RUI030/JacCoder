import from main { contain_string }

test "case 0" {
    want = 2;
    got = contain_string('hello', 'll');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = contain_string('aaaaa', 'bba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = contain_string('hello', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = contain_string('hello', 'hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = contain_string('hi', 'hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = contain_string('mississippi', 'issip');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = contain_string('mississippi', 'mis');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 7;
    got = contain_string('mississippi', 'ippi');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = contain_string('abracadabra', 'cad');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = -1;
    got = contain_string('abcd', 'e');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 0;
    got = contain_string('abcd', 'abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}
