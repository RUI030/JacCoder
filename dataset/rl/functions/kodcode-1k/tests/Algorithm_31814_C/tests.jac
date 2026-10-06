import from main { concatenate_elimination }

test "case 0" {
    want = 'abcdef';
    got = concatenate_elimination(['a', 'b', 'c'], ['d', 'e', 'f']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '';
    got = concatenate_elimination(['a', 'b'], ['a', 'b']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'acde';
    got = concatenate_elimination(['a', 'b', 'c'], ['b', 'd', 'e']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'mo';
    got = concatenate_elimination(['m', 'n'], ['n', 'o']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = concatenate_elimination([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'a';
    got = concatenate_elimination(['a'], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'b';
    got = concatenate_elimination([], ['b']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'abz';
    got = concatenate_elimination(['a', 'x', 'y'], ['b', 'x', 'y', 'z']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
