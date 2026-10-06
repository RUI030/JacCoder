import from main { add_and_multiply }

test "case 0" {
    want = 10;
    got = add_and_multiply(2, 3, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 15;
    got = add_and_multiply(0, 5, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 20;
    got = add_and_multiply(5, 0, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -6;
    got = add_and_multiply(-1, -1, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = add_and_multiply(-1, 3, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = add_and_multiply(2, 3, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
