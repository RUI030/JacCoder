import from main { is_treasure_code }

test "case 0" {
    want = 'YES';
    got = is_treasure_code([1, 3, 5, 5, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = is_treasure_code([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'NO';
    got = is_treasure_code([3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = is_treasure_code([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = is_treasure_code([1, 2, 1, 2, 1, 2, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
