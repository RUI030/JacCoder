import from main { max_removable_bricks }

test "case 0" {
    want = 6;
    got = max_removable_bricks(3, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 12;
    got = max_removable_bricks(5, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = max_removable_bricks(1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = max_removable_bricks(2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = max_removable_bricks(6, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = max_removable_bricks(4, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
