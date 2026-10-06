import from main { is_special_number }

test "case 0" {
    want = 'YES';
    got = is_special_number(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = is_special_number(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = is_special_number(25);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = is_special_number(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = is_special_number(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = is_special_number(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'NO';
    got = is_special_number(11);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'YES';
    got = is_special_number(1000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'NO';
    got = is_special_number(999999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'YES';
    got = is_special_number(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'YES';
    got = is_special_number(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'YES';
    got = is_special_number(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
