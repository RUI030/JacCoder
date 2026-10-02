import from main { word_frequency }

test "empty text" {
    want = {};
    got = word_frequency("");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "only punctuation" {
    want = {};
    got = word_frequency("!! ?? ...");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case folded" {
    want = {"the": 3};
    got = word_frequency("The the THE");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "inner punctuation kept" {
    want = {"don't": 2, "stop": 1};
    got = word_frequency("don't stop, don't!");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "newlines and tabs" {
    want = {"a": 2, "b": 2};
    got = word_frequency("a\tb\na b");
    assert got == want, f"expected={want!r} actual={got!r}";
}
