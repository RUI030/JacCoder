import from main { contains_nearby_duplicate }

test "case 0" {
    want = True;
    got = contains_nearby_duplicate([1, 2, 3, 1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = contains_nearby_duplicate([1, 0, 1, 1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = contains_nearby_duplicate([1, 2, 3, 1, 2, 3], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = contains_nearby_duplicate([1, 2, 3, 4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = contains_nearby_duplicate([1, 2, 3, 1, 2, 3, 1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = contains_nearby_duplicate([1, 2, 3, 4, 1], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = contains_nearby_duplicate([1, 2, 3, 4, 5, 6, 7, 8, 9, 1], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = contains_nearby_duplicate([1, 2, 1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
