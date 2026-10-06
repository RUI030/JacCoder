import from main { min_operations_to_transform }

test "case 0" {
    want = 0;
    got = min_operations_to_transform('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = min_operations_to_transform('abc', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -1;
    got = min_operations_to_transform('abcd', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = min_operations_to_transform('abc', 'aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = min_operations_to_transform('abc', 'ccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = min_operations_to_transform('aab', 'aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = min_operations_to_transform('abb', 'aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = min_operations_to_transform('abcd', 'aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = min_operations_to_transform('abbcc', 'abcac');
    assert got == want, f"expected={want!r} actual={got!r}";
}
