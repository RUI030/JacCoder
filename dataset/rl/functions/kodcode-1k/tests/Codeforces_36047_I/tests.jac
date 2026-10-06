import from main { distinct_string_after_k_operations }

test "case 0" {
    want = 2;
    got = distinct_string_after_k_operations(2, 1, 'ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = distinct_string_after_k_operations(3, 2, 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = distinct_string_after_k_operations(3, 3, 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = distinct_string_after_k_operations(3, 2, 'aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = distinct_string_after_k_operations(3, 3, 'aab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = distinct_string_after_k_operations(4, 10, 'abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}
