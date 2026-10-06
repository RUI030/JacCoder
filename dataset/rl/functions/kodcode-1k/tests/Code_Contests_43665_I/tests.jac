import from main { longest_balanced_subsequence }

test "case 0" {
    want = 6;
    got = longest_balanced_subsequence(6, '()()()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_balanced_subsequence(8, '(())))(()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = longest_balanced_subsequence(3, '((()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = longest_balanced_subsequence(10, '(()(()))()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = longest_balanced_subsequence(5, '(((((');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 8;
    got = longest_balanced_subsequence(10, ')()()()()(');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = longest_balanced_subsequence(1, '(');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = longest_balanced_subsequence(1, ')');
    assert got == want, f"expected={want!r} actual={got!r}";
}
