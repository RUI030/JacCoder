import from main { find_maximum }

test "case 0" {
    want = 5;
    got = find_maximum([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = find_maximum([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = find_maximum([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 7;
    got = find_maximum([7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1000001;
    got = find_maximum([1000000, 500000, 1000001]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = None;
    got = find_maximum([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
