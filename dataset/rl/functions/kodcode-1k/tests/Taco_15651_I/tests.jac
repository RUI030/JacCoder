import from main { hasPairWithSum }

test "case 0" {
    want = True;
    got = hasPairWithSum([1, 2, 3, 4, 5], 5, 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = hasPairWithSum([1, 2, 3, 4, 5], 5, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = hasPairWithSum([1], 1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = hasPairWithSum([1, 2, 3, 4], 4, 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = hasPairWithSum([4, 5, 1, 2], 4, 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = hasPairWithSum([1, 5, 3, 6, 4, 2, 0], 7, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = hasPairWithSum([-1, -2, -3, -4, -5], 5, -8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = hasPairWithSum([1, 2, 3, 4, -1, -4], 6, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = hasPairWithSum([10000000, -10000000], 2, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = hasPairWithSum([10000000, 10000000], 2, 20000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = hasPairWithSum([10000000, 10000000], 2, 10000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
