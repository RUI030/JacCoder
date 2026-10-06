import from main { max_coins }

test "case 0" {
    want = 15;
    got = max_coins([5, 3, 7, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 22;
    got = max_coins([8, 15, 3, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = max_coins([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 7;
    got = max_coins([4, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 20;
    got = max_coins([10, 10, 10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 42;
    got = max_coins([20, 30, 2, 2, 2, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
