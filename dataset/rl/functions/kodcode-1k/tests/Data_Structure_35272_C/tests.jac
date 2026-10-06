import from main { num_digits }

test "case 0" {
    want = 4;
    got = num_digits(1234);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 9;
    got = num_digits(999999999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = num_digits(-1234);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 9;
    got = num_digits(-999999999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = num_digits(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = num_digits(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = num_digits(-7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = num_digits(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = num_digits(-1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
