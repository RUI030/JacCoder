import from main { sum_of_squares }

test "case 0" {
    want = 1;
    got = sum_of_squares(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = sum_of_squares(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 14;
    got = sum_of_squares(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 55;
    got = sum_of_squares(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 385;
    got = sum_of_squares(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1240;
    got = sum_of_squares(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 42925;
    got = sum_of_squares(50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 338350;
    got = sum_of_squares(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
