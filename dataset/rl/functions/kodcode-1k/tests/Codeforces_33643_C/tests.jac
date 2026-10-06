import from main { tribonacci }

test "case 0" {
    want = 0;
    got = tribonacci(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = tribonacci(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = tribonacci(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = tribonacci(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = tribonacci(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 7;
    got = tribonacci(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 13;
    got = tribonacci(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 24;
    got = tribonacci(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 44;
    got = tribonacci(8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 81;
    got = tribonacci(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 29249425;
    got = tribonacci(30);
    assert got == want, f"expected={want!r} actual={got!r}";
}
