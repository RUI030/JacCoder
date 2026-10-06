import from main { least_interval }

test "case 0" {
    want = 8;
    got = least_interval(['A', 'A', 'A', 'B', 'B', 'B'], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = least_interval(['A', 'A', 'A', 'B', 'B', 'B'], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 6;
    got = least_interval(['A', 'B', 'C', 'A', 'B', 'C'], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = least_interval([], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 12;
    got = least_interval(['A', 'A', 'A', 'B', 'B', 'B', 'C', 'C', 'C', 'D', 'E', 'F'], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = least_interval(['A', 'A', 'B', 'B'], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = least_interval(['A'], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 21;
    got = least_interval(['A', 'A', 'A', 'A', 'A'], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 7;
    got = least_interval(['A', 'A', 'B', 'C', 'D', 'E', 'A'], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 5;
    got = least_interval(['A', 'B', 'C', 'D', 'E'], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
