import from main { reverse_integer }

test "case 0" {
    want = 321;
    got = reverse_integer(123);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -321;
    got = reverse_integer(-123);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 21;
    got = reverse_integer(1200);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 7;
    got = reverse_integer(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = reverse_integer(1534236469);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = reverse_integer(-1534236469);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = reverse_integer(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
