import from main { max_songs }

test "case 0" {
    want = 3;
    got = max_songs([3, 5, 4, 11, 6], 17);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = max_songs([2, 3, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = max_songs([5, 8, 12], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = max_songs([5, 8, 4], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = max_songs([4, 6, 3, 7, 2], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = max_songs([5, 5, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = max_songs([3, 3, 3, 3], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = max_songs([1, 2, 3], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = max_songs([], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
