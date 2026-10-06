import from main { three_sum }

test "case 0" {
    want = True;
    got = three_sum([1, 2, 3, 4, 5], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = three_sum([1, 2, 3, 4, 5], 50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = three_sum([10, 20, 30, 40, 50], 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = three_sum([1, 2, 4, 8, 16], 32);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = three_sum([1, 1, 1, 2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = three_sum([1, 1, 1, 1, 2, 2, 2, 3], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = three_sum([1, 4, 4, 4, 5, 6, 7], 15);
    assert got == want, f"expected={want!r} actual={got!r}";
}
