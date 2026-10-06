import from main { circular_shift }

test "case 0" {
    want = [3, 4, 5, 1, 2];
    got = circular_shift([1, 2, 3, 4, 5], 2, True);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 3, 4, 1];
    got = circular_shift([1, 2, 3, 4], 1, True);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4, 5, 1, 2, 3];
    got = circular_shift([1, 2, 3, 4, 5], 2, False);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [4, 1, 2, 3];
    got = circular_shift([1, 2, 3, 4], 1, False);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3, 4, 5, 1, 2];
    got = circular_shift([1, 2, 3, 4, 5], 7, True);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [4, 1, 2, 3];
    got = circular_shift([1, 2, 3, 4], 5, False);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = circular_shift([], 2, True);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [];
    got = circular_shift([], 2, False);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1];
    got = circular_shift([1], 3, True);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [1];
    got = circular_shift([1], 3, False);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = [1, 2, 3, 4, 5];
    got = circular_shift([1, 2, 3, 4, 5], 0, True);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = [1, 2, 3, 4, 5];
    got = circular_shift([1, 2, 3, 4, 5], 5, True);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = [1, 2, 3, 4, 5];
    got = circular_shift([1, 2, 3, 4, 5], 5, False);
    assert got == want, f"expected={want!r} actual={got!r}";
}
