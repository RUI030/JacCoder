import from main { filter_and_square }

test "case 0" {
    want = [25, 49, 81];
    got = filter_and_square([1, 3, 5, 7, 9], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = filter_and_square([1, 3, 4], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4, 16, 36];
    got = filter_and_square([2, 4, 6], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 4, 25];
    got = filter_and_square([-3, -1, 0, 2, 5], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [100];
    got = filter_and_square([-3, 0, 5, 10], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [25];
    got = filter_and_square([5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = filter_and_square([5], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [0, 1, 4];
    got = filter_and_square([-2, -1, 0, 1, 2], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [16];
    got = filter_and_square([4], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [40000, 90000];
    got = filter_and_square([100, 200, 300], 150);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = [9, 9, 9];
    got = filter_and_square([3, 3, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = [9, 9, 9];
    got = filter_and_square([3, 3, 3], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = [];
    got = filter_and_square([3, 3, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
