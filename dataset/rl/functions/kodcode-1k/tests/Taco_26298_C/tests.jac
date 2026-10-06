import from main { toggle_bulbs }

test "case 0" {
    want = [1, 0, 0];
    got = toggle_bulbs(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 0, 0, 1, 0];
    got = toggle_bulbs(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 0, 0, 1, 0, 0];
    got = toggle_bulbs(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1];
    got = toggle_bulbs(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 0, 0, 1];
    got = toggle_bulbs(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1];
    got = toggle_bulbs(16);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 0, 0, 1, 0, 0, 0, 0, 1, 0];
    got = toggle_bulbs(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
