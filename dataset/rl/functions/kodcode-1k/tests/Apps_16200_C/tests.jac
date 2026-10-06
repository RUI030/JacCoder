import from main { maxPairProduct }

test "case 0" {
    want = 30;
    got = maxPairProduct([3, 5, 2, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 30;
    got = maxPairProduct([10, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 100;
    got = maxPairProduct([1, 1, 1, 10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = maxPairProduct([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 999999000000;
    got = maxPairProduct([1000000, 2, 3, 999999]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = maxPairProduct([2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 20;
    got = maxPairProduct([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
