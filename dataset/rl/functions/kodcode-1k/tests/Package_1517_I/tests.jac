import from main { find_mismatched_parentheses }

test "case 0" {
    want = 0;
    got = find_mismatched_parentheses('()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = find_mismatched_parentheses('(())');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = find_mismatched_parentheses('((())');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = find_mismatched_parentheses('(((((()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = find_mismatched_parentheses('())');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = find_mismatched_parentheses('))))');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = find_mismatched_parentheses(')(');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = find_mismatched_parentheses('(()))(');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = find_mismatched_parentheses('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = find_mismatched_parentheses('abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}
