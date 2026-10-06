import from main { min_operations_to_make_subsequence }

test "case 0" {
    want = 0;
    got = min_operations_to_make_subsequence('abc', 'bahbgdc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = min_operations_to_make_subsequence('axc', 'bahbgdc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = min_operations_to_make_subsequence('xyz', 'abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = min_operations_to_make_subsequence('', 'bahbgdc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = min_operations_to_make_subsequence('abc', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = min_operations_to_make_subsequence('abcdef', 'abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = min_operations_to_make_subsequence('a', 'bbbbbaaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = min_operations_to_make_subsequence('z', 'bbbbbaaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}
