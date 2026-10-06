import from main { three_sum }

test "case 0" {
    want = True;
    got = three_sum([12, 3, 6, 1, 6, 9], 24);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = three_sum([1, 2, 3, 4, 5], 50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = three_sum([-1, 0, 1], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = three_sum([10, 20, 10, 30, 40, -10, -20], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = three_sum([0, -1, 2, -3, 1, -2, 3], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = three_sum([-5, -4, -3, -2, -1], -9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = three_sum([1, 2, 3, 1, 2, 3, 6], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = three_sum([4, 6, 1, 3, 9, 7], 16);
    assert got == want, f"expected={want!r} actual={got!r}";
}
