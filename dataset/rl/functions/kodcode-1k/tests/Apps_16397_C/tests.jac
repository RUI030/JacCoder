import from main { remaining_passengers }

test "case 0" {
    want = 5;
    got = remaining_passengers([(10, 0), (3, 5), (5, 8)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 17;
    got = remaining_passengers([(3, 0), (9, 1), (4, 10), (12, 2), (6, 1), (7, 10)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = remaining_passengers([(3, 5), (9, 4), (4, 6)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = remaining_passengers([(5, 0), (3, 0), (2, 0)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -5;
    got = remaining_passengers([(0, 0), (0, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = remaining_passengers([(2, 2), (3, 3), (5, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = remaining_passengers([(5, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = remaining_passengers([(0, 0)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
