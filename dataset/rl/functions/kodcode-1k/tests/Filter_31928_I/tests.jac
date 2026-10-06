import from main { last_occurrence }

test "case 0" {
    want = 9;
    got = last_occurrence('hello world', 'l');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 7;
    got = last_occurrence('hello world', 'o');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -1;
    got = last_occurrence('hello world', 'z');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = last_occurrence('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = last_occurrence('a', 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = last_occurrence('', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = last_occurrence('abcabc', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 5;
    got = last_occurrence('abcabc', 'c');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = last_occurrence('aaaaa', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}
