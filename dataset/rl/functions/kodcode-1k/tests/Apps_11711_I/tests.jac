import from main { maximize_sum }

test "case 0" {
    want = 10;
    got = maximize_sum([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = maximize_sum([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 22;
    got = maximize_sum([3, 6, 8, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 300;
    got = maximize_sum([100, 200]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 21;
    got = maximize_sum([1, 3, 2, 6, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
