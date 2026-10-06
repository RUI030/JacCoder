import from main { most_common_word }

test "case 0" {
    want = 'apple';
    got = most_common_word(['apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'apple';
    got = most_common_word(['apple', 'banana', 'apple', 'banana', 'cherry']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = most_common_word([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'banana';
    got = most_common_word(['apple', 'banana', 'apple', 'banana', 'banana']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'apple';
    got = most_common_word(['apple', 'banana', 'cherry', 'cherry', 'apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
