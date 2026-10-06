import from main { first_occurrence }

test "case 0" {
    want = 6;
    got = first_occurrence('hello world', 'world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = first_occurrence('abcabcabc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = first_occurrence('abcdef', 'e');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = first_occurrence('hello world', 'python');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = first_occurrence('abcdef', 'gh');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = first_occurrence('hello world', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = first_occurrence('', 'world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = first_occurrence('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = first_occurrence('abcdef', 'abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}
