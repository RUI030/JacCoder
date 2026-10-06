import from main { min_operations }

test "case 0" {
    want = 3;
    got = min_operations('kitten', 'sitting');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_operations('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = min_operations('', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = min_operations('abc', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = min_operations('abc', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = min_operations('abcdef', 'azced');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = min_operations('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = min_operations('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = min_operations('a', 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}
