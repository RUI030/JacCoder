import from main { min_total_time }

test "case 0" {
    want = 12;
    got = min_total_time(3, 2, 4, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 12;
    got = min_total_time(3, 3, 4, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 20;
    got = min_total_time(2, 1, 5, [4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = min_total_time(4, 4, 1, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 100;
    got = min_total_time(1, 1, 100, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = min_total_time(3, 2, 1, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 10;
    got = min_total_time(5, 3, 2, [5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
