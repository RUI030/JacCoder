import from main { count_differences }

test "case 0" {
    want = 0;
    got = count_differences('abcde', 'abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = count_differences('abcde', 'abfde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = count_differences('hello', 'herro');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = count_differences('abcd', 'wxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = count_differences('abc', 'abd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = count_differences('abc', 'dbc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = count_differences('aaaaa', 'aaaab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = count_differences('aaaaa', 'baaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}
