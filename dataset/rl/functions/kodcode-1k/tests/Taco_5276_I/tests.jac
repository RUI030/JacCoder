import from main { max_continuous_green_time }

test "case 0" {
    want = 30;
    got = max_continuous_green_time(4, [10, 20, 10, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 25;
    got = max_continuous_green_time(5, [5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 36;
    got = max_continuous_green_time(3, [12, 12, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 8;
    got = max_continuous_green_time(6, [4, 4, 1, 1, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 9;
    got = max_continuous_green_time(2, [9, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2000;
    got = max_continuous_green_time(2, [1000, 1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1000;
    got = max_continuous_green_time(2, [1, 1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1000;
    got = max_continuous_green_time(2, [1000, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 3;
    got = max_continuous_green_time(3, [1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 2;
    got = max_continuous_green_time(3, [1, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
