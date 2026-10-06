import from main { sum_of_range }

test "case 0" {
    want = 15;
    got = sum_of_range(1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 18;
    got = sum_of_range(3, 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = sum_of_range(5, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -2;
    got = sum_of_range(-2, -2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = sum_of_range(0, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = sum_of_range(-3, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -15;
    got = sum_of_range(-5, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = sum_of_range(6, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
