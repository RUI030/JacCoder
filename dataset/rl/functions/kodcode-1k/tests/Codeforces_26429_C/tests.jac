import from main { min_rooms }

test "case 0" {
    want = 2;
    got = min_rooms(5, 2, [3, 5, 4, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = min_rooms(5, 0, [1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = min_rooms(5, 4, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = min_rooms(5, 0, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = min_rooms(6, 1, [1, 2, 4, 5, 7, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = min_rooms(1, 0, [999]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = min_rooms(3, 1000, [500, 1000, 1500]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
