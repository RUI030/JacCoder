import from main { longest_subsequence_without_repeat }

test "case 0" {
    want = 3;
    got = longest_subsequence_without_repeat('abcabcbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = longest_subsequence_without_repeat('bbbbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = longest_subsequence_without_repeat('pwwkew');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = longest_subsequence_without_repeat('abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = longest_subsequence_without_repeat('aabbccdd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = longest_subsequence_without_repeat('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = longest_subsequence_without_repeat('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 26;
    got = longest_subsequence_without_repeat('abcdefghijklmnopqrstuvwxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = longest_subsequence_without_repeat('jjjj');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 4;
    got = longest_subsequence_without_repeat('abacabadabacaba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 26;
    got = longest_subsequence_without_repeat('qwertyuiopasdfghjklzxcvbnm');
    assert got == want, f"expected={want!r} actual={got!r}";
}
