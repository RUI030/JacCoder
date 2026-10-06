import from main { group_strings_by_length }

test "case 0" {
    want = {1: ['i'], 2: ['de', 'jk'], 3: ['abc', 'fgh'], 4: ['lmno']};
    got = group_strings_by_length(['abc', 'de', 'fgh', 'i', 'jk', 'lmno']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {};
    got = group_strings_by_length([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {1: ['a', 'b', 'c']};
    got = group_strings_by_length(['a', 'b', 'c']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {1: ['a'], 2: ['bc'], 3: ['def']};
    got = group_strings_by_length(['a', 'bc', 'def']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {1: ['I'], 4: ['long', 'tiny'], 5: ['short'], 9: ['minuscule']};
    got = group_strings_by_length(['long', 'short', 'tiny', 'minuscule', 'I']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
