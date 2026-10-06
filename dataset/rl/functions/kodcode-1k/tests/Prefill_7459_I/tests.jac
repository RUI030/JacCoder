import from main { parse_duration }

test "case 0" {
    want = 0;
    got = parse_duration('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = parse_duration('123456');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -1;
    got = parse_duration('12:34:56:78');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = parse_duration('ab:cd:ef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = parse_duration('12:60:00');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = parse_duration('12:59:60');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = parse_duration('-1:30:30');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -1;
    got = parse_duration('1:-30:30');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = -1;
    got = parse_duration('1:30:-30');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 3723;
    got = parse_duration('01:02:03');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 0;
    got = parse_duration('00:00:00');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 86400;
    got = parse_duration('24:00:00');
    assert got == want, f"expected={want!r} actual={got!r}";
}
