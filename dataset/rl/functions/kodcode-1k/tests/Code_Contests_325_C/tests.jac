import from main { max_consecutive_dishes }

test "case 0" {
    want = (5, 12);
    got = max_consecutive_dishes(5, [2, 3, 1, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (7, 23);
    got = max_consecutive_dishes(7, [4, 3, 2, 1, 5, 6, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (1, 10);
    got = max_consecutive_dishes(1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (5, 5);
    got = max_consecutive_dishes(5, [1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (3, 3000000);
    got = max_consecutive_dishes(3, [1000000, 1000000, 1000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
