import from main { climb_stairs_optimized }

test "case 0" {
    want = 2;
    got = climb_stairs_optimized(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = climb_stairs_optimized(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 8;
    got = climb_stairs_optimized(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 89;
    got = climb_stairs_optimized(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = climb_stairs_optimized(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = climb_stairs_optimized(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 20365011074;
    got = climb_stairs_optimized(50);
    assert got == want, f"expected={want!r} actual={got!r}";
}
