import from main { binomial_coefficient }

test "case 0" {
    want = 1;
    got = binomial_coefficient(5, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = binomial_coefficient(5, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = binomial_coefficient(5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 45;
    got = binomial_coefficient(10, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 252;
    got = binomial_coefficient(10, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = binomial_coefficient(5, 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 184756;
    got = binomial_coefficient(20, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 100891344545564193334812497256;
    got = binomial_coefficient(100, 50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = binomial_coefficient(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 1;
    got = binomial_coefficient(0, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1000;
    got = binomial_coefficient(1000, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 1;
    got = binomial_coefficient(1000, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
