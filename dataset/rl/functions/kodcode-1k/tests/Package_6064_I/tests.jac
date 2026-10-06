import from main { simulate_bacterial_growth }

test "case 0" {
    want = 100;
    got = simulate_bacterial_growth(100, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 400;
    got = simulate_bacterial_growth(100, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10800;
    got = simulate_bacterial_growth(100, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 43200;
    got = simulate_bacterial_growth(100, 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 691200;
    got = simulate_bacterial_growth(100, 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 200;
    got = simulate_bacterial_growth(100, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1200;
    got = simulate_bacterial_growth(100, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3600;
    got = simulate_bacterial_growth(100, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
