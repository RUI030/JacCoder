import from main { longest_repeating_substring }

test "case 0" {
    want = 3;
    got = longest_repeating_substring('aaabb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = longest_repeating_substring('abbbbbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_repeating_substring('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = longest_repeating_substring('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = longest_repeating_substring('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = longest_repeating_substring('aaaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = longest_repeating_substring('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = longest_repeating_substring('aabbaaabbbaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = longest_repeating_substring('abababababa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = longest_repeating_substring('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = longest_repeating_substring('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 1;
    got = longest_repeating_substring('z');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 4;
    got = longest_repeating_substring('aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 2;
    got = longest_repeating_substring('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 5;
    got = longest_repeating_substring('abbcccddddeeeee');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 3;
    got = longest_repeating_substring('abcdeee');
    assert got == want, f"expected={want!r} actual={got!r}";
}
