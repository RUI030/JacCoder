import from main { balanced_brackets }

test "empty is balanced" {
    want = True;
    got = balanced_brackets("");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "unclosed" {
    want = False;
    got = balanced_brackets("{[()]");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "early close" {
    want = False;
    got = balanced_brackets(")(");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "interleaved wrong" {
    want = False;
    got = balanced_brackets("([)]");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "nested ok" {
    want = True;
    got = balanced_brackets("f(x[{1}], y)");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "text only" {
    want = True;
    got = balanced_brackets("no brackets here");
    assert got == want, f"expected={want!r} actual={got!r}";
}
