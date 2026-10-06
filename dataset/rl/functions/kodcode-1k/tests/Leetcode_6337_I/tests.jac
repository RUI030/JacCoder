import from main { count_good_strings }

test "case 0" {
    want = 6;
    got = count_good_strings(['cat', 'bt', 'hat', 'tree'], 'atach');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = count_good_strings(['hello', 'world'], 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = count_good_strings(['a', 'b', 'c'], 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = count_good_strings(['apple', 'peach', 'lemon'], 'lepalemnoch');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = count_good_strings(['aaa', 'a', 'aa', 'aaaa'], 'aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = count_good_strings([], 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = count_good_strings(['a', 'b', 'c'], '');
    assert got == want, f"expected={want!r} actual={got!r}";
}
