import from main { can_form_rectangle }

test "case 0" {
    want = 'YES';
    got = can_form_rectangle(4, [(2, 4), (4, 2), (4, 2), (2, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = can_form_rectangle(3, [(1, 2), (2, 1), (2, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'NO';
    got = can_form_rectangle(6, [(1, 2), (2, 3), (2, 1), (3, 4), (2, 1), (1, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = can_form_rectangle(1, [(1, 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = can_form_rectangle(2, [(1, 2), (2, 1)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = can_form_rectangle(2, [(1, 2), (1, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'NO';
    got = can_form_rectangle(5, [(2, 2), (2, 2), (3, 3), (3, 3), (3, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'YES';
    got = can_form_rectangle(8, [(1, 2), (2, 1), (2, 1), (1, 2), (1, 2), (2, 1), (2, 1), (1, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
