import from main { max_water_collected }

test "case 0" {
    want = 0;
    got = max_water_collected([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = max_water_collected([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = max_water_collected([5, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 20;
    got = max_water_collected([5, 10, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = max_water_collected([5, 1, 1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = max_water_collected([1, 2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 900;
    got = max_water_collected([100, 200, 300, 400, 500]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 30;
    got = max_water_collected([10, 5, 10, 5, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
