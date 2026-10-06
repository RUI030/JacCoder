import from main { count_strings }

test "case 0" {
    want = {'a': 1, 'b': 1, 'c': 1};
    got = count_strings(['a', 'b', 'c']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'a': 2, 'b': 3, 'c': 2};
    got = count_strings(['a', 'a', 'b', 'b', 'b', 'c', 'c']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {};
    got = count_strings([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {'a': 1};
    got = count_strings(['a']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'a': 1, 'A': 2, 'b': 2, 'B': 1};
    got = count_strings(['a', 'A', 'b', 'B', 'A', 'b']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {'!': 3, '@': 1, '#': 1};
    got = count_strings(['!', '@', '#', '!', '!']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
