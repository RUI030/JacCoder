import from main { has_reverse_pair }

test "case 0" {
    want = 'Yes';
    got = has_reverse_pair('ab ba cd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'No';
    got = has_reverse_pair('abc def ghi');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'No';
    got = has_reverse_pair('level racecar civic');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'No';
    got = has_reverse_pair('one two three');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'No';
    got = has_reverse_pair('madam level racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Yes';
    got = has_reverse_pair('abcd dcba abba baab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'No';
    got = has_reverse_pair('singleword');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'No';
    got = has_reverse_pair('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'Yes';
    got = has_reverse_pair('ab ba ab ba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'Yes';
    got = has_reverse_pair('ab ba ba ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}
