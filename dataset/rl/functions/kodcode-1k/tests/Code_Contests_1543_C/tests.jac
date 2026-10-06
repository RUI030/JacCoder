import from main { min_operations }

test "case 0" {
    want = 3;
    got = min_operations('kitten', 'sitting');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = min_operations('flaw', 'lawn');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = min_operations('', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = min_operations('a', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = min_operations('abc', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = min_operations('abc', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = min_operations('abcd', 'abcf');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 4;
    got = min_operations('abcd', 'wxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 3;
    got = min_operations('abcdef', 'azced');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 5;
    got = min_operations('intention', 'execution');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 0;
    got = min_operations('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 0;
    got = min_operations('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 1;
    got = min_operations('abc', 'ac');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 1;
    got = min_operations('abc', 'abx');
    assert got == want, f"expected={want!r} actual={got!r}";
}
