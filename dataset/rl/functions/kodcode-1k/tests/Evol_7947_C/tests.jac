import from main { books_to_rewrap }

test "case 0" {
    want = 0;
    got = books_to_rewrap(45, 35, 0.0, 0.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 80;
    got = books_to_rewrap(45, 35, 1.0, 1.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 23;
    got = books_to_rewrap(45, 35, 0.2, 0.4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = books_to_rewrap(1, 1, 0.5, 0.5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = books_to_rewrap(0, 0, 0.2, 0.4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
