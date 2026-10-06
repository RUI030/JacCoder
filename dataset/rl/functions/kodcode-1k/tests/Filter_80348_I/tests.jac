import from main { calculate_average }

test "case 0" {
    want = 3;
    got = calculate_average([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = calculate_average([0, 0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -3;
    got = calculate_average([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -0.6;
    got = calculate_average([-1, 2, -3, 4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = calculate_average([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = calculate_average([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
