import from main { min_distance }

test "case 0" {
    want = 3;
    got = min_distance('horse', 'ros');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = min_distance('intention', 'execution');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = min_distance('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = min_distance('abc', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = min_distance('', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = min_distance('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = min_distance('abc', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = min_distance('a', 'ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = min_distance('ab', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 3;
    got = min_distance('abcdef', 'azced');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 3;
    got = min_distance('kitten', 'sitting');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 2;
    got = min_distance('flaw', 'lawn');
    assert got == want, f"expected={want!r} actual={got!r}";
}
