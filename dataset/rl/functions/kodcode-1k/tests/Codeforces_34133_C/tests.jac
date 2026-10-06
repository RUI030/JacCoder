import from main { amusement_park_finish_times }

test "case 0" {
    want = [5];
    got = amusement_park_finish_times(1, [0], [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5, 8, 10];
    got = amusement_park_finish_times(3, [0, 2, 4], [5, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4, 7, 9];
    got = amusement_park_finish_times(3, [0, 0, 0], [4, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [3, 5, 6, 8, 11];
    got = amusement_park_finish_times(5, [0, 1, 2, 2, 4], [3, 2, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [4, 6, 9, 10];
    got = amusement_park_finish_times(4, [0, 2, 5, 6], [4, 2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
