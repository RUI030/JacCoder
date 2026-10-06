import from main { is_good_sequence }

test "case 0" {
    want = 'YES';
    got = is_good_sequence(4, [1, 2, 3, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = is_good_sequence(5, [1, 5, 11, 5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = is_good_sequence(2, [1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = is_good_sequence(2, [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = is_good_sequence(6, [1, 1, 2, 2, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = is_good_sequence(6, [1, 1, 1, 1, 1, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
