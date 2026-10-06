import from main { collatz_steps }

test "case 0" {
    want = 0;
    got = collatz_steps(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 8;
    got = collatz_steps(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = collatz_steps(16);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 111;
    got = collatz_steps(27);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 9;
    got = collatz_steps(12);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 20;
    got = collatz_steps(19);
    assert got == want, f"expected={want!r} actual={got!r}";
}
