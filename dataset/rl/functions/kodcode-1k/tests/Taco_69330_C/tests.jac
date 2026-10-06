import from main { max_difference }

test "case 0" {
    want = 0;
    got = max_difference(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = max_difference(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = max_difference(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 999999998;
    got = max_difference(1000000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = max_difference(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
