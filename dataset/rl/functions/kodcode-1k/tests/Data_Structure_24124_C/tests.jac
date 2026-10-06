import from main { count }

test "case 0" {
    want = 4;
    got = count([1, 2, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = count([2, 5, 3, 6], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = count([1], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = count([2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = count([1, 2], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = count([], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = count([1, 2, 3], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = count([], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = count([3], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 541;
    got = count([1, 2, 5], 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
