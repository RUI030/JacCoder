import from main { max_cookie_sum }

test "case 0" {
    want = 16;
    got = max_cookie_sum([7, 3, 5, 2, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 9;
    got = max_cookie_sum([1, 3, 5, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 8;
    got = max_cookie_sum([4, 4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 15;
    got = max_cookie_sum([5, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 19999999;
    got = max_cookie_sum([10000000, 9999999, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 150;
    got = max_cookie_sum([1, 100, 2, 3, 50]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_cookie_sum([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
