import from main { minimum_passes }

test "case 0" {
    want = 2;
    got = minimum_passes(5, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = minimum_passes(6, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 49999;
    got = minimum_passes(99999, 50000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 50000;
    got = minimum_passes(100000, 25000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = minimum_passes(3, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = minimum_passes(8, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = minimum_passes(8, 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}
