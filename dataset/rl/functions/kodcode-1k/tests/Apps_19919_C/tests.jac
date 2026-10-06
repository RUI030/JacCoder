import from main { find_permutations }

test "case 0" {
    want = ['abc', 'acb', 'bac', 'bca', 'cab', 'cba'];
    got = find_permutations('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['aab', 'aba', 'baa'];
    got = find_permutations('aab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['a'];
    got = find_permutations('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [''];
    got = find_permutations('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['aaa'];
    got = find_permutations('aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['ab', 'ba'];
    got = find_permutations('ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ['abcd', 'abdc', 'acbd', 'acdb', 'adbc', 'adcb', 'bacd', 'badc', 'bcad', 'bcda', 'bdac', 'bdca', 'cabd', 'cadb', 'cbad', 'cbda', 'cdab', 'cdba', 'dabc', 'dacb', 'dbac', 'dbca', 'dcab', 'dcba'];
    got = find_permutations('abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}
