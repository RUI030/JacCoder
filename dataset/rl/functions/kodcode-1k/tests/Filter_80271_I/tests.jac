import from main { add_numbers }

test "case 0" {
    want = 5;
    got = add_numbers(2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = add_numbers(0, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = add_numbers(0, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = add_numbers(5, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -2;
    got = add_numbers(-1, -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = add_numbers(-1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = add_numbers(1, -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = add_numbers(-2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
