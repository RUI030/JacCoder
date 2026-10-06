import from main { find_closest_match }

test "case 0" {
    want = 1500;
    got = find_closest_match([1500], 1600);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1600;
    got = find_closest_match([1500, 1700, 1600, 1800, 2000], 1600);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1600;
    got = find_closest_match([1500, 1700, 1600, 1800, 2000], 1650);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1700;
    got = find_closest_match([1500, 1700, 1600, 1800, 2000], 1750);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1600;
    got = find_closest_match([1500, 1700, 1600, 1800, 2000], 1650);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1500;
    got = find_closest_match([1500, 1400, 1300, 1200], 1650);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1900;
    got = find_closest_match([1900, 2000, 2100, 2200], 1800);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1550;
    got = find_closest_match([1500, 1550, 1650, 1700], 1600);
    assert got == want, f"expected={want!r} actual={got!r}";
}
