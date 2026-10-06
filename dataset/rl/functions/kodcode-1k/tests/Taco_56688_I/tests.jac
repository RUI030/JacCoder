import from main { calculate_final_water_flow }

test "case 0" {
    want = 300;
    got = calculate_final_water_flow(32, 10, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 150;
    got = calculate_final_water_flow(25, 10, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 200;
    got = calculate_final_water_flow(32, 5, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 150;
    got = calculate_final_water_flow(25, 7, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 300;
    got = calculate_final_water_flow(32, 14, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 100;
    got = calculate_final_water_flow(20, 2, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 100;
    got = calculate_final_water_flow(35, 0, 50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 75;
    got = calculate_final_water_flow(20, 12, 50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 75;
    got = calculate_final_water_flow(30, 12, 50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 300;
    got = calculate_final_water_flow(32, 18, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
