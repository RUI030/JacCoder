import from main { sum_range }

test "case 0" {
    want = 15;
    got = sum_range(1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = sum_range(3, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -6;
    got = sum_range(-3, -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = sum_range(-2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = sum_range(5, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 15;
    got = sum_range(0, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5050;
    got = sum_range(1, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = sum_range(0, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
