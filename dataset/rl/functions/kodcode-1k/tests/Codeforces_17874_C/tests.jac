import from main { min_distance }

test "case 0" {
    want = 0;
    got = min_distance('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = min_distance('abc', 'abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = min_distance('abcd', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = min_distance('abc', 'adc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = min_distance('horse', 'ros');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = min_distance('intention', 'execution');
    assert got == want, f"expected={want!r} actual={got!r}";
}
