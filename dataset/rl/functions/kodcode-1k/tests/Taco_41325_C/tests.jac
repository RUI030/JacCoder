import from main { longest_balanced_substring }

test "case 0" {
    want = 4;
    got = longest_balanced_substring('(()))');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_balanced_substring(')()())');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = longest_balanced_substring('()()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = longest_balanced_substring('())');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = longest_balanced_substring('((()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = longest_balanced_substring('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = longest_balanced_substring('(');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = longest_balanced_substring(')');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = longest_balanced_substring('(((');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = longest_balanced_substring(')))');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 2;
    got = longest_balanced_substring('()(()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 6;
    got = longest_balanced_substring('((()))');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 6;
    got = longest_balanced_substring('()(())');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 4;
    got = longest_balanced_substring('(())((');
    assert got == want, f"expected={want!r} actual={got!r}";
}
