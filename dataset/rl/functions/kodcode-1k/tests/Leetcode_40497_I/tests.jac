import from main { reorder_to_standard_lexicographical }

test "case 0" {
    want = ['apple', 'hero', 'word'];
    got = reorder_to_standard_lexicographical('abcdefghijklmnopqrstuvwxyz', ['word', 'apple', 'hero']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['apple', 'banana', 'cherry'];
    got = reorder_to_standard_lexicographical('abcdefghijklmnopqrstuvwxyz', ['apple', 'banana', 'cherry']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['apple', 'banana', 'cherry'];
    got = reorder_to_standard_lexicographical('zyxwvutsrqponmlkjihgfedcba', ['cherry', 'banana', 'apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['apple', 'apple', 'banana'];
    got = reorder_to_standard_lexicographical('abcdefghijklmnopqrstuvwxyz', ['apple', 'banana', 'apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = reorder_to_standard_lexicographical('abcdefghijklmnopqrstuvwxyz', []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['Apple', 'Banana', 'apple', 'banana'];
    got = reorder_to_standard_lexicographical('abcdefghijklmnopqrstuvwxyz', ['Apple', 'apple', 'Banana', 'banana']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ['ané', 'word', 'éclair'];
    got = reorder_to_standard_lexicographical('abcdefghijklmnopqrstuvwxyz', ['word', 'ané', 'éclair']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = ['apple'];
    got = reorder_to_standard_lexicographical('abcdefghijklmnopqrstuvwxyz', ['apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
