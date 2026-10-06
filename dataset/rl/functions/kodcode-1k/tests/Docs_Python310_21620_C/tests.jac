import from main { calculate_sum }

test "case 0" {
    want = 30;
    got = calculate_sum([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = calculate_sum([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 25;
    got = calculate_sum([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 30;
    got = calculate_sum([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 30;
    got = calculate_sum([-1, 2, -3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
