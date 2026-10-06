import from main { distinct_powers_in_range }

test "case 0" {
    want = 15;
    got = distinct_powers_in_range(5, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 69;
    got = distinct_powers_in_range(10, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = distinct_powers_in_range(2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 9183;
    got = distinct_powers_in_range(100, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 9;
    got = distinct_powers_in_range(2, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = distinct_powers_in_range(2, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = distinct_powers_in_range(5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
