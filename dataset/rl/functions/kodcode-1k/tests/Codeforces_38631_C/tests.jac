import from main { effective_coverage }

test "case 0" {
    want = 60;
    got = effective_coverage(100, 3, [(10, 30), (40, 60), (70, 90)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 20;
    got = effective_coverage(100, 3, [(10, 30), (10, 30), (10, 30)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 60;
    got = effective_coverage(100, 3, [(10, 30), (20, 50), (40, 70)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 100;
    got = effective_coverage(100, 1, [(0, 100)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = effective_coverage(100, 0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 50;
    got = effective_coverage(100, 2, [(10, 50), (50, 60)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1000000;
    got = effective_coverage(1000000, 2, [(0, 500000), (500000, 1000000)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 140;
    got = effective_coverage(150, 5, [(10, 60), (50, 100), (90, 150), (30, 90), (60, 120)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
