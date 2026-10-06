import from main { max_photos }

test "case 0" {
    want = 3;
    got = max_photos([200000000, 150000000, 300000000, 500000000], 800000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = max_photos([100000000, 200000000, 300000000], 1000000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = max_photos([500000000, 400000000, 600000000], 100000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = max_photos([100000000, 100000000, 300000000, 400000000], 500000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = max_photos([100000000, 300000000], 400000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = max_photos([], 500000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_photos([100000000, 300000000], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
