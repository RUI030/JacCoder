import from main { example_add }

test "case 0" {
    want = 5;
    got = example_add(2, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = example_add(0, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = example_add(5, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -2;
    got = example_add(-1, -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = example_add(-1, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
