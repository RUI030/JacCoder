import from main { calculate_final_amount }

test "case 0" {
    want = 135.0;
    got = calculate_final_amount([30, 20, 50, 40, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 192.0;
    got = calculate_final_amount([60, 80, 100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 296.0;
    got = calculate_final_amount([150, 100, 120]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 99.0;
    got = calculate_final_amount([99]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 90.0;
    got = calculate_final_amount([99, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 179.1;
    got = calculate_final_amount([199]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 160.8;
    got = calculate_final_amount([200, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 400.0;
    got = calculate_final_amount([500]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1.0;
    got = calculate_final_amount([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
