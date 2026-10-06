import from main { climb_stairs }

test "case 0" {
    want = 1;
    got = climb_stairs(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = climb_stairs(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = climb_stairs(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 7;
    got = climb_stairs(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 13;
    got = climb_stairs(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 274;
    got = climb_stairs(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 121415;
    got = climb_stairs(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 53798080;
    got = climb_stairs(30);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 10562230626642;
    got = climb_stairs(50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 180396380815100901214157639;
    got = climb_stairs(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
