import from main { is_balanced }

test "case 0" {
    want = True;
    got = is_balanced('()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_balanced('[]');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_balanced('{}');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_balanced('()[]{}');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_balanced('([{}])');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_balanced('(]');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_balanced('([)]');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_balanced('({[)]}');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_balanced('[({})](]');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_balanced('{[()]}');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = is_balanced('{[()()]}');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = is_balanced('{([])}');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = True;
    got = is_balanced('(((())))');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = False;
    got = is_balanced('()()(()');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = False;
    got = is_balanced('[(])');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = True;
    got = is_balanced('(()[{}])');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = True;
    got = is_balanced('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 17" {
    want = False;
    got = is_balanced('(');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 18" {
    want = False;
    got = is_balanced(')');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 19" {
    want = False;
    got = is_balanced(']');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 20" {
    want = False;
    got = is_balanced('}');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 21" {
    want = False;
    got = is_balanced('[');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 22" {
    want = False;
    got = is_balanced('{');
    assert got == want, f"expected={want!r} actual={got!r}";
}
