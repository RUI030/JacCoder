import from main { repeat_characters }

test "case 0" {
    want = 'hheelllloo';
    got = repeat_characters('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'CCooddiinngg';
    got = repeat_characters('Coding');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = repeat_characters('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'aa';
    got = repeat_characters('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'ZZ';
    got = repeat_characters('Z');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '!!@@##';
    got = repeat_characters('!@#');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'hhii  tthheerree';
    got = repeat_characters('hi there');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '112233';
    got = repeat_characters('123');
    assert got == want, f"expected={want!r} actual={got!r}";
}
