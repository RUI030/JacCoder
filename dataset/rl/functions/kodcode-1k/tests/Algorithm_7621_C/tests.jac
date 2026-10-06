import from main { sort_by_length }

test "case 0" {
    want = ['banana', 'apple', 'grape', 'pear'];
    got = sort_by_length(['apple', 'banana', 'pear', 'grape']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['abcdef', 'abcd', 'abc', 'ab', 'a'];
    got = sort_by_length(['a', 'abc', 'abcd', 'ab', 'abcdef']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = sort_by_length([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['length', 'same', 'test'];
    got = sort_by_length(['same', 'length', 'test']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['onlyone'];
    got = sort_by_length(['onlyone']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['xxx', 'yyy', 'xx', 'zz', 'x', 'a'];
    got = sort_by_length(['x', 'xx', 'xxx', 'yyy', 'zz', 'a']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
