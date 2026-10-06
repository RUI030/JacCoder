import from main { palindromic_num }

test "case 0" {
    want = 'Palindromic';
    got = palindromic_num(121);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Not Palindromic';
    got = palindromic_num(123);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Palindromic';
    got = palindromic_num(1221);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Palindromic';
    got = palindromic_num(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Palindromic';
    got = palindromic_num(12321);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Not Palindromic';
    got = palindromic_num(12345);
    assert got == want, f"expected={want!r} actual={got!r}";
}
