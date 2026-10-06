import from main { convert_to_24_hour_format }

test "case 0" {
    want = '14:30';
    got = convert_to_24_hour_format('02:30 PM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '11:45';
    got = convert_to_24_hour_format('11:45 AM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '12:00';
    got = convert_to_24_hour_format('12:00 PM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '00:00';
    got = convert_to_24_hour_format('12:00 AM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '01:00';
    got = convert_to_24_hour_format('01:00 AM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '13:00';
    got = convert_to_24_hour_format('01:00 PM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '00:59';
    got = convert_to_24_hour_format('12:59 AM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '12:59';
    got = convert_to_24_hour_format('12:59 PM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '07:05';
    got = convert_to_24_hour_format('07:05 AM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '19:05';
    got = convert_to_24_hour_format('07:05 PM');
    assert got == want, f"expected={want!r} actual={got!r}";
}
