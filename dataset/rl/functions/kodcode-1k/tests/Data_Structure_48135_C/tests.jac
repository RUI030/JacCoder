import from main { int_divide }

test "case 0" {
    want = 5;
    got = int_divide(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 15;
    got = int_divide(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = int_divide(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 42;
    got = int_divide(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 176;
    got = int_divide(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}
