import from main { filter_integers }

test "case 0" {
    want = {};
    got = filter_integers({'a': 'string', 'b': 3.5, 'c': None, 'd': [1, 2]});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'a': 1, 'b': 2, 'c': 3};
    got = filter_integers({'a': 1, 'b': 2, 'c': 3});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'a': 1, 'd': 4};
    got = filter_integers({'a': 1, 'b': 'string', 'c': 3.5, 'd': 4});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {};
    got = filter_integers({});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'a': 0, 'b': -1, 'c': 2};
    got = filter_integers({'a': 0, 'b': -1, 'c': 2});
    assert got == want, f"expected={want!r} actual={got!r}";
}
