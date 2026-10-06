import from main { maximum_candies }

test "case 0" {
    want = 9;
    got = maximum_candies(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 16;
    got = maximum_candies(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 25;
    got = maximum_candies(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 9;
    got = maximum_candies(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1000000;
    got = maximum_candies(1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
