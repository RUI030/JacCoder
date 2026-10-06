import from main { is_balanced_parentheses }

test "case 0" {
    want = 'YES';
    got = is_balanced_parentheses('(())');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = is_balanced_parentheses('()()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = is_balanced_parentheses('((()))');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = is_balanced_parentheses('(()))');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = is_balanced_parentheses(')(');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = is_balanced_parentheses('(()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'YES';
    got = is_balanced_parentheses('()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'NO';
    got = is_balanced_parentheses('(');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'NO';
    got = is_balanced_parentheses(')');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'YES';
    got = is_balanced_parentheses('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
