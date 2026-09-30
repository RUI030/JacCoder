import from main { wrap_text }

test "empty" { assert wrap_text("", 5) == []; }
test "exact fit" { assert wrap_text("ab cd", 5) == ["ab cd"]; }
test "long word alone" { assert wrap_text("a extraordinary b", 4) == ["a", "extraordinary", "b"]; }
test "collapses whitespace" { assert wrap_text("  one   two  ", 20) == ["one two"]; }
test "width one" { assert wrap_text("x y z", 1) == ["x", "y", "z"]; }
