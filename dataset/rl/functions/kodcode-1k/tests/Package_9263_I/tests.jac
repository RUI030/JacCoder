import from main { longest_valid_parentheses }

test "case 0" {
    want = 0;
    got = longest_valid_parentheses('(((((');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = longest_valid_parentheses('()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = longest_valid_parentheses('(()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = longest_valid_parentheses(')()())');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = longest_valid_parentheses('(()(()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = longest_valid_parentheses('()(())');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = longest_valid_parentheses('()(()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 6;
    got = longest_valid_parentheses('()()()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = longest_valid_parentheses('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 14;
    got = longest_valid_parentheses('()(())()(()())');
    assert got == want, f"expected={want!r} actual={got!r}";
}
