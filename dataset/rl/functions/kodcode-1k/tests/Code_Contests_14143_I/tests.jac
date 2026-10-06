import from main { can_rearrange_students }

test "case 0" {
    want = 'YES';
    got = can_rearrange_students(5, [1, 3, 2, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = can_rearrange_students(3, [5, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = can_rearrange_students(1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = can_rearrange_students(4, [10, 20, 30, 40]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = can_rearrange_students(4, [10, 10, 10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = can_rearrange_students(5, [1, 2, 3, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'YES';
    got = can_rearrange_students(6, [6, 1, 8, 3, 7, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
