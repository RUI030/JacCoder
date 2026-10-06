import from main { generate_combinations }

test "case 0" {
    want = [];
    got = generate_combinations('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['a'];
    got = generate_combinations('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['a', 'b', 'ab'];
    got = generate_combinations('ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['a', 'b', 'c', 'ab', 'ac', 'bc', 'abc'];
    got = generate_combinations('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['a', 'a', 'b', 'aa', 'ab', 'ab', 'aab'];
    got = generate_combinations('aab');
    assert got == want, f"expected={want!r} actual={got!r}";
}
