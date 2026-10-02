import from main { pascal_row }

test "row one" {
    want = [1, 1];
    got = pascal_row(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "row five" {
    want = [1, 5, 10, 10, 5, 1];
    got = pascal_row(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "row ten middle" {
    want = 252;
    got = pascal_row(10)[5];
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "row twenty length" {
    want = 21;
    got = len(pascal_row(20));
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "row thirty sum" {
    want = 2 ** 30;
    got = sum(pascal_row(30));
    assert got == want, f"expected={want!r} actual={got!r}";
}
