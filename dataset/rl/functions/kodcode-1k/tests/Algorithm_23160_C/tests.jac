import from main { is_valid_expression }

test "case 0" {
    want = True;
    got = is_valid_expression('{[()()]}');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_valid_expression('{[(])}');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_valid_expression('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_valid_expression('()()()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_valid_expression('(()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_valid_expression('([{}])[]');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_valid_expression('[({])}');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_valid_expression('(({{[[');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_valid_expression(']]}}))');
    assert got == want, f"expected={want!r} actual={got!r}";
}
