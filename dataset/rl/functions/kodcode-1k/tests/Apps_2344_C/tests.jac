import from main { total_duration }

test "case 0" {
    want = '6 hours 30 minutes';
    got = total_duration([30, 45, 120, 180, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '3 hours 0 minutes';
    got = total_duration([60, 60, 60]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '0 hours 35 minutes';
    got = total_duration([10, 20, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '1 hours 0 minutes';
    got = total_duration([30, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '4 hours 0 minutes';
    got = total_duration([90, 45, 30, 75]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '0 hours 0 minutes';
    got = total_duration([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
