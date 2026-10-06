import from main { convert_to_24_hour_format }

test "case 0" {
    want = '14:45';
    got = convert_to_24_hour_format('02:45 PM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '00:00';
    got = convert_to_24_hour_format('12:00 AM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '01:15';
    got = convert_to_24_hour_format('01:15 AM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '12:00';
    got = convert_to_24_hour_format('12:00 PM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '23:59';
    got = convert_to_24_hour_format('11:59 PM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '04:20';
    got = convert_to_24_hour_format('04:20 AM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '19:05';
    got = convert_to_24_hour_format('07:05 PM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '12:30';
    got = convert_to_24_hour_format('12:30 PM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '06:45';
    got = convert_to_24_hour_format('06:45 AM');
    assert got == want, f"expected={want!r} actual={got!r}";
}
