import from main { climb_stairs_custom }

test "case 0" {
    want = 8;
    got = climb_stairs_custom(5, [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = climb_stairs_custom(3, [1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 89;
    got = climb_stairs_custom(10, [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = climb_stairs_custom(1, [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 12;
    got = climb_stairs_custom(7, [1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = climb_stairs_custom(3, [4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = climb_stairs_custom(6, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = climb_stairs_custom(4, [2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 9;
    got = climb_stairs_custom(5, [1, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
