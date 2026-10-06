import from main { trap_rainwater }

test "case 0" {
    want = 6;
    got = trap_rainwater([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = trap_rainwater([3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = trap_rainwater([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = trap_rainwater([3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = trap_rainwater([3, 2, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = trap_rainwater([3, 0, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = trap_rainwater([3, 2, 0, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
