import from main { can_all_elements_be_zero }

test "case 0" {
    want = 'YES';
    got = can_all_elements_be_zero(5, 3, [0, 0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = can_all_elements_be_zero(5, 3, [1, 0, 1, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'NO';
    got = can_all_elements_be_zero(6, 4, [1, 1, 0, 1, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = can_all_elements_be_zero(4, 2, [1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = can_all_elements_be_zero(6, 2, [1, 0, 1, 0, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = can_all_elements_be_zero(7, 3, [1, 0, 1, 0, 0, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
