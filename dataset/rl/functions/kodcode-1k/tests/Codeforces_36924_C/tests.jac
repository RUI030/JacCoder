import from main { can_rearrange_to_equal }

test "case 0" {
    want = 'YES';
    got = can_rearrange_to_equal(123, 321);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = can_rearrange_to_equal(111, 111);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = can_rearrange_to_equal(102, 201);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = can_rearrange_to_equal(123, 456);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = can_rearrange_to_equal(10, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = can_rearrange_to_equal(998, 8999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'YES';
    got = can_rearrange_to_equal(123456789, 987654321);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'NO';
    got = can_rearrange_to_equal(123456789, 987654322);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'YES';
    got = can_rearrange_to_equal(1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'NO';
    got = can_rearrange_to_equal(1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
