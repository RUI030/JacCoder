import from main { can_be_balanced }

test "case 0" {
    want = 'YES';
    got = can_be_balanced(4, 1, '(())');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = can_be_balanced(4, 1, '(()(');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = can_be_balanced(0, 0, '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = can_be_balanced(6, 2, '())(()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = can_be_balanced(4, 1, '((((');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = can_be_balanced(4, 0, '()()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'NO';
    got = can_be_balanced(4, 1, '(()(');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'NO';
    got = can_be_balanced(4, 1, '())');
    assert got == want, f"expected={want!r} actual={got!r}";
}
