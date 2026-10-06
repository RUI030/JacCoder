import from main { max_palindromic_substrings }

test "case 0" {
    want = 4;
    got = max_palindromic_substrings('0000');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = max_palindromic_substrings('1111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = max_palindromic_substrings('0011');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = max_palindromic_substrings('0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = max_palindromic_substrings('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = max_palindromic_substrings('00011');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = max_palindromic_substrings('001');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 4;
    got = max_palindromic_substrings('1111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 6;
    got = max_palindromic_substrings('010101');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 6;
    got = max_palindromic_substrings('110100');
    assert got == want, f"expected={want!r} actual={got!r}";
}
