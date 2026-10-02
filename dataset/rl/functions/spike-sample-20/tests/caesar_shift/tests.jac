import from main { caesar_shift }

test "negative shift" {
    want = "abc";
    got = caesar_shift("bcd", -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "large shift" {
    want = "abc";
    got = caesar_shift("xyz", 29);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "mixed case and digits" {
    want = "Khoor, Zruog 42";
    got = caesar_shift("Hello, World 42", 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "zero shift" {
    want = "Same";
    got = caesar_shift("Same", 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "empty" {
    want = "";
    got = caesar_shift("", 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "full negative wrap" {
    want = "Z";
    got = caesar_shift("A", -27);
    assert got == want, f"expected={want!r} actual={got!r}";
}
