import from main { calculate_total_price }

test "case 0" {
    want = 0.0;
    got = calculate_total_price(0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 100.0;
    got = calculate_total_price(1, [100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 285.0;
    got = calculate_total_price(2, [100, 200]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 900.0;
    got = calculate_total_price(4, [100, 200, 300, 400]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1680.0;
    got = calculate_total_price(6, [100, 200, 300, 400, 500, 600]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 950.0;
    got = calculate_total_price(5, [100, 100, 200, 300, 300]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 475.0;
    got = calculate_total_price(3, [150, 250, 100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
