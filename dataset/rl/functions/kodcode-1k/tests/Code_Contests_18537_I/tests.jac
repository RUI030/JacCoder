import from main { redistribute_heights }

test "case 0" {
    want = [180, 140, 170, 150, 160];
    got = redistribute_heights(5, [160, 150, 180, 170, 140]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [200, 100, 150, 120];
    got = redistribute_heights(4, [100, 200, 150, 120]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [300, 100, 200];
    got = redistribute_heights(3, [300, 100, 200]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [150, 150, 150, 150];
    got = redistribute_heights(4, [150, 150, 150, 150]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [100, 50];
    got = redistribute_heights(2, [50, 100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
