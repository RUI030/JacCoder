import from main { modular_exponential }

test "case 0" {
    want = 24;
    got = modular_exponential(2, 10, 1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = modular_exponential(3, 7, 13);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 32;
    got = modular_exponential(2, 5, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = modular_exponential(10, 0, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 140625001;
    got = modular_exponential(2, 1000000000, 1000000007);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 652541198;
    got = modular_exponential(123456789, 987654321, 1000000007);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = modular_exponential(987654321, 123456789, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = modular_exponential(10, 100, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = modular_exponential(1, 1000, 1000000007);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 1;
    got = modular_exponential(1, 0, 1000000007);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 0;
    got = modular_exponential(0, 1000, 1000000007);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 1;
    got = modular_exponential(0, 0, 1000000007);
    assert got == want, f"expected={want!r} actual={got!r}";
}
