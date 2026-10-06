import from main { min_operations_to_empty_string }

test "case 0" {
    want = 3;
    got = min_operations_to_empty_string('abacab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = min_operations_to_empty_string('aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = min_operations_to_empty_string('abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = min_operations_to_empty_string('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = min_operations_to_empty_string('xyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = min_operations_to_empty_string('abacabadabacaba');
    assert got == want, f"expected={want!r} actual={got!r}";
}
