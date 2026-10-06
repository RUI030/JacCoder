import from main { min_additional_time }

test "case 0" {
    want = 0;
    got = min_additional_time(3, 5, [10, 20, 15], [60, 100, 75]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 25;
    got = min_additional_time(3, 5, [10, 25, 15], [60, 100, 75]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 75;
    got = min_additional_time(3, 5, [20, 25, 30], [60, 100, 75]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 20;
    got = min_additional_time(4, 10, [10, 15, 12, 30], [100, 200, 150, 280]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 70;
    got = min_additional_time(1, 10, [15], [80]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
