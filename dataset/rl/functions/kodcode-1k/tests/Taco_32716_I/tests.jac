import from main { elevation_difference }

test "case 0" {
    want = 833;
    got = elevation_difference(20, 15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 500;
    got = elevation_difference(12, 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = elevation_difference(10, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 833;
    got = elevation_difference(-5, -10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2500;
    got = elevation_difference(10, -5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -3333;
    got = elevation_difference(-10, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 16667;
    got = elevation_difference(50, -50);
    assert got == want, f"expected={want!r} actual={got!r}";
}
