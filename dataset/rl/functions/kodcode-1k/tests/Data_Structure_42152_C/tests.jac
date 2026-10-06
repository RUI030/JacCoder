import from main { find_nth_digit }

test "case 0" {
    want = 1;
    got = find_nth_digit(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 9;
    got = find_nth_digit(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = find_nth_digit(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = find_nth_digit(11);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = find_nth_digit(12);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = find_nth_digit(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = find_nth_digit(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = find_nth_digit(250);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 3;
    got = find_nth_digit(1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 1;
    got = find_nth_digit(1000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = find_nth_digit(1000000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 3;
    got = find_nth_digit(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 0;
    got = find_nth_digit(11);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 1;
    got = find_nth_digit(250);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 1;
    got = find_nth_digit(1000000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
