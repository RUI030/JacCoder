import from main { simplify_path }

test "case 0" {
    want = '/home/';
    got = simplify_path('/home/');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '/';
    got = simplify_path('/../');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '/home/foo/';
    got = simplify_path('/home//foo/');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '/c/';
    got = simplify_path('/a/./b/../../c/');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '/a/b/c/';
    got = simplify_path('/a//b////c/d//././/..');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '/';
    got = simplify_path('/../..');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '/';
    got = simplify_path('/../../../../');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '/c/';
    got = simplify_path('/a/../../b/../c//.//');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '/';
    got = simplify_path('/.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '/';
    got = simplify_path('/./././.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = '/a/';
    got = simplify_path('/a/b/../c/..');
    assert got == want, f"expected={want!r} actual={got!r}";
}
