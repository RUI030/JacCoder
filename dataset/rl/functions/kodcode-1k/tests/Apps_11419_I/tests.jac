import from main { balance_parentheses }

test "case 0" {
    want = '(())';
    got = balance_parentheses('(()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '(())()';
    got = balance_parentheses('())(');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '()()';
    got = balance_parentheses(')(');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = balance_parentheses('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '()';
    got = balance_parentheses('()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '(())';
    got = balance_parentheses('(())');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '(((())))';
    got = balance_parentheses('((((');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '(((())))';
    got = balance_parentheses('))))');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '()()()';
    got = balance_parentheses('()()()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '((()))';
    got = balance_parentheses('((()))');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = '((()))';
    got = balance_parentheses('((())');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = '(())()()';
    got = balance_parentheses('())()(');
    assert got == want, f"expected={want!r} actual={got!r}";
}
