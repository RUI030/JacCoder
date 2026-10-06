import from main { strip_and_sort }

test "case 0" {
    want = '27dehllloorw';
    got = strip_and_sort('He!lL7o W2or@lD!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '';
    got = strip_and_sort('!!@@##$$%%^^&&**()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '12345';
    got = strip_and_sort('12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'abcdef';
    got = strip_and_sort('abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'tuvwxyz';
    got = strip_and_sort('ZYXWVUT');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'abcdef';
    got = strip_and_sort('aBcDeF');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '';
    got = strip_and_sort('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '123abc';
    got = strip_and_sort('A!b@C#1$2%3');
    assert got == want, f"expected={want!r} actual={got!r}";
}
