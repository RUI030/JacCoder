import from main { can_transform }

test "case 0" {
    want = 'YES';
    got = can_transform('hello', 'heelllo');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = can_transform('world', 'worlld');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'NO';
    got = can_transform('typing', 'typpping');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = can_transform('game', 'gaem');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = can_transform('short', 'shortt');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = can_transform('abc', 'abcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'NO';
    got = can_transform('abc', 'aac');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'YES';
    got = can_transform('exact', 'exact');
    assert got == want, f"expected={want!r} actual={got!r}";
}
