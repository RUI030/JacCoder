import from main { min_insertions_to_balance }

test "case 0" {
    want = [1, 2];
    got = min_insertions_to_balance(2, ['abcbc', 'aabbccc']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0];
    got = min_insertions_to_balance(1, ['aaaa']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0];
    got = min_insertions_to_balance(1, ['aabbcc']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0];
    got = min_insertions_to_balance(1, ['abc']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0];
    got = min_insertions_to_balance(1, ['aaabbbcccdddeee']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [0, 2];
    got = min_insertions_to_balance(2, ['aabb', 'aabbcccddd']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
