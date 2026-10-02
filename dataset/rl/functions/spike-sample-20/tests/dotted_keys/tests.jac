import from main { dotted_keys }

test "flat dict unchanged" {
    want = {"x": 5, "y": 6};
    got = dotted_keys({"x": 5, "y": 6});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "empty dict" {
    want = {};
    got = dotted_keys({});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "deep nesting" {
    want = {"a.b.c.d": 7};
    got = dotted_keys({"a": {"b": {"c": {"d": 7}}}});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "empty branch dropped" {
    want = {"b": 0};
    got = dotted_keys({"a": {}, "b": 0});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "siblings" {
    want = {"p.q": 1, "p.r.s": 2, "t": 3};
    got = dotted_keys({"p": {"q": 1, "r": {"s": 2}}, "t": 3});
    assert got == want, f"expected={want!r} actual={got!r}";
}
