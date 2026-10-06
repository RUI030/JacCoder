import from main { total_journey_time }

test "case 0" {
    want = 5;
    got = total_journey_time(2, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 50;
    got = total_journey_time(5, [5, 10, 15, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 18;
    got = total_journey_time(3, [7, 11]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 17;
    got = total_journey_time(4, [8, 3, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = total_journey_time(4, [1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 360;
    got = total_journey_time(4, [120, 120, 120]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 80;
    got = total_journey_time(6, [10, 20, 5, 15, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
