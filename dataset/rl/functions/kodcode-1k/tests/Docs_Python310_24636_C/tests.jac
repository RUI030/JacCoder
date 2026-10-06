import from main { find_first_fibonacci_with_substring }

test "case 0" {
    want = 144;
    got = find_first_fibonacci_with_substring('144');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 89;
    got = find_first_fibonacci_with_substring('89');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = find_first_fibonacci_with_substring('5');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = find_first_fibonacci_with_substring('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 21;
    got = find_first_fibonacci_with_substring('21');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6765;
    got = find_first_fibonacci_with_substring('6765');
    assert got == want, f"expected={want!r} actual={got!r}";
}
