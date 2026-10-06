import from main { most_frequent_letter }

test "case 0" {
    want = 'a';
    got = most_frequent_letter('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'a';
    got = most_frequent_letter('ababc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'a';
    got = most_frequent_letter('abac');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'a';
    got = most_frequent_letter('abcdabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = most_frequent_letter('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'a';
    got = most_frequent_letter('a1!a2@b#');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '';
    got = most_frequent_letter('12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'A';
    got = most_frequent_letter('AaBbCc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'a';
    got = most_frequent_letter('%%%a%%%e%%%i%%%o%%%u%%%');
    assert got == want, f"expected={want!r} actual={got!r}";
}
