import from main { gcd_of_three }

test "case 0" {
    want = 1;
    got = gcd_of_three(4, 3, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = gcd_of_three(5, 9, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = gcd_of_three(12, 15, 18);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = gcd_of_three(17, 22, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 7;
    got = gcd_of_three(7, 14, 21);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 100;
    got = gcd_of_three(100, 200, 300);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 25;
    got = gcd_of_three(50, 25, 75);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = gcd_of_three(1, 1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 9;
    got = gcd_of_three(9, 27, 81);
    assert got == want, f"expected={want!r} actual={got!r}";
}
