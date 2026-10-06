import from main { next_bigger }

test "case 0" {
    want = 38627;
    got = next_bigger(38276);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 12354;
    got = next_bigger(12345);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1528524;
    got = next_bigger(1528452);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 143568;
    got = next_bigger(138654);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = next_bigger(54321);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = next_bigger(999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = next_bigger(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 536479;
    got = next_bigger(534976);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = -1;
    got = next_bigger(9876543210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = -1;
    got = next_bigger(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
