import from main { contains_nearby_duplicates }

test "case 0" {
    want = 'YES';
    got = contains_nearby_duplicates([1, 2, 3, 1, 2, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = contains_nearby_duplicates([1, 0, 1, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'NO';
    got = contains_nearby_duplicates([1, 2, 3], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = contains_nearby_duplicates([1, 2, 3, 4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = contains_nearby_duplicates([1, 2, 3, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = contains_nearby_duplicates([1, 2, 3, 1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'NO';
    got = contains_nearby_duplicates([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
