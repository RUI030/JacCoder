import from main { wrap_text }

test "empty" {
    want = [];
    got = wrap_text("", 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "exact fit" {
    want = ["ab cd"];
    got = wrap_text("ab cd", 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "long word alone" {
    want = ["a", "extraordinary", "b"];
    got = wrap_text("a extraordinary b", 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "collapses whitespace" {
    want = ["one two"];
    got = wrap_text("  one   two  ", 20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "width one" {
    want = ["x", "y", "z"];
    got = wrap_text("x y z", 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
