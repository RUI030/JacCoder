import from main { determine_rank }

test "case 0" {
    want = 3;
    got = determine_rank(5, [100, 200, 100, 300, 200], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = determine_rank(4, [50, 100, 75, 100], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = determine_rank(1, [100], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = determine_rank(3, [100, 100, 100], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = determine_rank(4, [100, 150, 150, 200], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = determine_rank(4, [100, 200, 300, 400], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
