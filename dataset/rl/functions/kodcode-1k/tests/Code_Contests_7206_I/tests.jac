import from main { longest_balanced_substring }

test "case 0" {
    want = 6;
    got = longest_balanced_substring('AABBAB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_balanced_substring('AAABB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = longest_balanced_substring('AAAA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = longest_balanced_substring('AAAAAA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = longest_balanced_substring('BBBBBB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = longest_balanced_substring('A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = longest_balanced_substring('B');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 8;
    got = longest_balanced_substring('ABABABAB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 8;
    got = longest_balanced_substring('AABBAABB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 10;
    got = longest_balanced_substring('AAABBBAABB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 2;
    got = longest_balanced_substring('AB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 2;
    got = longest_balanced_substring('BA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 8;
    got = longest_balanced_substring('AABABBAAB');
    assert got == want, f"expected={want!r} actual={got!r}";
}
