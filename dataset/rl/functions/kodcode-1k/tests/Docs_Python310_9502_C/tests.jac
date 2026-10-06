import from main { process_strings }

test "case 0" {
    want = [('apple', 1)];
    got = process_strings(['apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [('apple', 3)];
    got = process_strings(['apple', 'apple', 'apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [('apple', 1), ('banana', 1), ('apple', 1)];
    got = process_strings(['apple', 'banana', 'apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [('apple', 2), ('banana', 1), ('apple', 3), ('banana', 2), ('cherry', 1)];
    got = process_strings(['apple', 'apple', 'banana', 'apple', 'apple', 'apple', 'banana', 'banana', 'cherry']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [('a', 2), ('b', 1), ('!', 3)];
    got = process_strings(['a', 'a', 'b', '!', '!', '!']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
